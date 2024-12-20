import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class AppOutlinedButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String text;
  final double fontSize;
  final Future<void> Function()? onPressed;
  final Color? color;
  final bool loadingEnabled;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final Color? bgColor;

  const AppOutlinedButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.fontSize = 18,
    this.onPressed,
    this.color,
    this.loadingEnabled = false,
    this.suffixIcon,
    this.textStyle,
    this.bgColor,
  }) : super(key: key);

  @override
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
  var isLoading = false;

  Future<void> onPressed() async {
    if (isLoading) return;
    if (widget.onPressed == null) return;

    try {
      if (widget.loadingEnabled) {
        setState(() {
          isLoading = true;
        });
      }
      await widget.onPressed!();
      if (widget.loadingEnabled) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (widget.loadingEnabled) {
        setState(() {
          isLoading = false;
        });
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 178.w,
      height: widget.height ?? 50.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.bgColor ?? R.colors.jetBlack_FF2E2E2E),
          side: MaterialStateProperty.all(
            BorderSide(
              color: widget.color ?? R.colors.lavenderBlue_FF966EC3,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(178.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? SizedBox(
                width: 20.r,
                height: 20.r,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5.r,
                    color: R.colors.white_FFF5F5F5,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: widget.suffixIcon != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: widget.textStyle ??
                        TextStyle(
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (widget.suffixIcon != null) widget.suffixIcon!
                ],
              ),
      ),
    );
  }
}
