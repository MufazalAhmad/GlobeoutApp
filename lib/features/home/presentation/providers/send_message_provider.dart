import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/home/domain/usecases/send_message.dart';

import '../../../../util/di/di.dart';

final sendMessageProvider =
    FutureProvider.family.autoDispose<void, String>((ref, phoneNumber) async {
  final sendMessage = sl<SendWhatsAppMessageUsecase>();
  final input = SendWhatsAppMessageUsecaseInput(phoneNumber: phoneNumber);

  await sendMessage(input);
});
