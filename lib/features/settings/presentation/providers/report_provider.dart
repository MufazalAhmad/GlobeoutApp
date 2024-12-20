import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/settings/domain/usecases/create_report.dart';
import 'package:globout/features/settings/presentation/providers/report_form_provider.dart';
import 'package:globout/util/di/di.dart';

final reportProvider = FutureProvider.autoDispose<void>((ref) async {
  final reportDescription = ref.watch(reportFormProvider);
  final user = ref.watch(userProvider);

  final createReport = sl<CreateReportUsecase>();
  final input = CreateReportUsecaseInput(
      userId: user!.id, description: reportDescription!);

  await createReport(input);
});
