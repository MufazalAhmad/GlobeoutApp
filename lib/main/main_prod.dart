import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/activity/domain/usecases/get_cached_events.dart';
import 'package:globout/features/activity/domain/usecases/update_activity_location.dart';
import 'package:globout/features/home/domain/usecases/init_background_isolates.dart';
import '../common/extensions/num.dart';
import '../features/activity/domain/usecases/fetch_location.dart';
import '../infrastructure/usecase_input.dart';
import '../util/router/router.dart';
import '../helpers/persistence/persistence_helper.dart';
import '../util/di/di.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _readyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  await sl<PersistenceHelper>().init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

Future<void> main() async {
  await _readyApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //Add device pixel ratio here
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderApp();
      },
    );
  }
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      startBackgroundService();
    });
  }

  Future<void> startBackgroundService() async {
    final initUsecase = sl<InitBackgroundIsolatesUsecase>();
    initUsecase(InitBackgroundIsolatesUsecaseInput());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setPadding(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // You can use the library anywhere in the app even in theme
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Inter",
        ),

        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        backButtonDispatcher: router.backButtonDispatcher,
      ),
    );
  }
}

/// {Isolates}
/// [on Ios Back ground service]
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  await _readyApp();
  DartPluginRegistrant.ensureInitialized();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  final updateActivityLocationUsecase = sl<UpdateActivityLocationUsecase>();
  final getEventsCachedUsecase = sl<GetEventsCachedUsecase>();

  final fetchLocationUsecase = sl<FetchLocationUsecase>();

  /// [bring to background ios]
  Timer.periodic(
    const Duration(minutes: 30),
        (timer) async {
      /// [fetch location]
      final location = await fetchLocationUsecase(NoInput());

      final output =
      await getEventsCachedUsecase(GetEventsCachedUsecaseInput());

      final cachedEvents = output.events;

      for (var event in cachedEvents) {
        final input = UpdateActivityLocationUsecaseInput(
          activityId: event.id,
          lat: location.lat,
          lng: location.lng,
        );
        await updateActivityLocationUsecase(input);
      }

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
        },
      );
    },
  );
  return true;
}

/// [on start service]
@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  await _readyApp();

  DartPluginRegistrant.ensureInitialized();

  /// [update application location on firebase]
  final updateActivityLocationUsecase = sl<UpdateActivityLocationUsecase>();
  final getEventsCachedUsecase = sl<GetEventsCachedUsecase>();

  ///  [fetch Location usecase]
  final fetchLocationUsecase = sl<FetchLocationUsecase>();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(
    const Duration(minutes: 30),
        (timer) async {
      final location = await fetchLocationUsecase(NoInput());

      final output =
      await getEventsCachedUsecase(GetEventsCachedUsecaseInput());

      final cachedEvents = output.events;

      for (var event in cachedEvents) {
        final input = UpdateActivityLocationUsecaseInput(
          activityId: event.id,
          lat: location.lat,
          lng: location.lng,
        );
        await updateActivityLocationUsecase(input);
      }

      service.invoke(
        'update',
        {"current_date": DateTime.now().toIso8601String()},
      );
    },
  );
}
