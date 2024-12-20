import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

class SendSmsUsecaseInput extends Input {
  String phoneNumber;
  SendSmsUsecaseInput({required this.phoneNumber});
}

class SendSmsUsecaseOutput extends Output {
  SendSmsUsecaseOutput();
}

@lazySingleton
class SendSmsUsecase
    extends Usecase<SendSmsUsecaseInput, SendSmsUsecaseOutput> {
  @override
  Future<SendSmsUsecaseOutput> call(SendSmsUsecaseInput input) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: input.phoneNumber,
      queryParameters: <String, String>{'body': "https://www.globout.app/"},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // iOS

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
    return SendSmsUsecaseOutput();
  }
}
