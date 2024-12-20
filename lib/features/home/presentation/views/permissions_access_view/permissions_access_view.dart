import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/home/presentation/providers/contacts_sync_provider.dart';
import 'package:globout/features/home/presentation/providers/permission_holder_model_provider.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';
import 'dialogs/permission_access_dialog.dart';
import 'widgets/bg_animation_widget.dart';

class PermissionAccessView extends ConsumerStatefulWidget {
  const PermissionAccessView({super.key});

  @override
  ConsumerState<PermissionAccessView> createState() =>
      _PermissionAccessViewState();
}

class _PermissionAccessViewState extends ConsumerState<PermissionAccessView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    scheduleMicrotask(() async {
      await request();

      ref.read(permissionModelProvider.notifier).addListener((state) {
        final isImportantPermissionsGranted = ref
            .read(permissionModelProvider.notifier)
            .allMustPermissionsGranted;

        if (isImportantPermissionsGranted) {
          loadAndNavigate();
        }
      });
    });
  }

  Future<void> request() async {
    final permissionsNotifier = ref.read(permissionModelProvider.notifier);

    for (final permission in permissionsNotifier.permissions!.allPermissions) {
      if (permission?.isGranted ?? true) {
        return;
      }

      await showDialog(
        context: context,
        builder: (context) {
          return PermissionAccessDialog(
            onReq: () async {
              await permissionsNotifier.request(permission);
              if (context.mounted) {
                GoRouter.of(context).pop();
              }
            },
            title: permission!.message,
          );
        },
      );
    }
  }

  Future<void> loadAndNavigate() async {
    await ref.read(contactsSyncProvider.future);
    if (mounted) {
      GoRouter.of(context).pushReplacement(RoutePaths.homeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          /// [BgAnimationWidget] is a widget that uses the [AccessContactsBgRivProviderAllowAccess] provider
          BgAnimationWidget(),
        ],
      ),
    );
  }
}
