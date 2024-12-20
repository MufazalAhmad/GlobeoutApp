import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/login_provider.dart';
import 'package:globout/util/resource/r.dart';

class ResendOtpCodeWidget extends ConsumerStatefulWidget {
  const ResendOtpCodeWidget({super.key});

  @override
  ConsumerState<ResendOtpCodeWidget> createState() =>
      _ResendOtpCodeWidgetState();
}

class _ResendOtpCodeWidgetState extends ConsumerState<ResendOtpCodeWidget> {
  var seconds = 30;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  void countdown() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        seconds--;
      });
      if (seconds > 0) {
        countdown();
      }
    }
  }

  Future<void> resend() async {
    setState(() {
      seconds = 30;
    });
    countdown();
    ref.read(loginProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: seconds == 0
          ? TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                foregroundColor:
                    MaterialStateProperty.all(R.colors.cyan_FF00C2B7),
              ),
              onPressed: resend,
              child: const Text(
                "Send now",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Send code again  ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "00:${seconds < 10 ? "0$seconds" : seconds}",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
    );
  }
}
