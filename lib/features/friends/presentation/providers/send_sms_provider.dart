import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/di/di.dart';
import '../../domain/usecases/send_sms.dart';

final sendSmsProvider =
    FutureProvider.family.autoDispose<void, String>((ref, phoneNumber) async {
  final sendSms = sl<SendSmsUsecase>();

  final input = SendSmsUsecaseInput(phoneNumber: phoneNumber);

  await sendSms(input);
});
