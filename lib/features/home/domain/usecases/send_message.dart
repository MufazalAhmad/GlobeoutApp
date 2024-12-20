import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';
import '../../../../util/exceptions/exceptions.dart';

class SendWhatsAppMessageUsecaseInput extends Input {
  final String phoneNumber;
  final String? message;

  SendWhatsAppMessageUsecaseInput({
    required this.phoneNumber,
    this.message,
  });
}

class SendWhatsAppMessageUsecaseOutput extends Output {
  SendWhatsAppMessageUsecaseOutput();
}

@lazySingleton
class SendWhatsAppMessageUsecase extends Usecase<
    SendWhatsAppMessageUsecaseInput, SendWhatsAppMessageUsecaseOutput> {
  @override
  Future<SendWhatsAppMessageUsecaseOutput> call(
      SendWhatsAppMessageUsecaseInput input) async {
    try {
      /// [Android]
      if (Platform.isAndroid) {
        final uri =
            Uri.parse('whatsapp://send?phone=${input.phoneNumber}&text=');
        if (!await launchUrl(uri)) {
          throw CouldNotLaunchUrlException(message: 'Could not launch');
        }
      } else {
        /// [ios]
        final uri = Uri.parse(
            "https://wa.me/${input.phoneNumber}?text=${Uri.parse('text=')}");
        if (!await launchUrl(uri)) {
          throw CouldNotLaunchUrlException(message: 'Could not launch');
        }
      }

      return SendWhatsAppMessageUsecaseOutput();
    } catch (e) {
      if (e.toString().contains("ACTIVITY_NOT_FOUND")) {
        throw WhatsappNotFoundException(message: "Whatsapp not Installed");
      }
      throw SomethingWentWrongException(message: e.toString());
    }
  }
}
