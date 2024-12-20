import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/util/resource/r.dart';

class RadiusButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String text;
  final double fontSize;
  final Future<void> Function()? onPressed;
  final Color? color;
  final bool loadingEnabled;
  final TextStyle? textStyle;
  final double? borderRadius;

  const RadiusButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.fontSize = 18,
    this.onPressed,
    this.color,
    this.loadingEnabled = false,
    this.textStyle,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<RadiusButton> createState() => _RadiusButtonState();
}

class _RadiusButtonState extends State<RadiusButton> {
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
            widget.color ?? R.colors.lavenderBlue_FF966EC3,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 178.r),
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
            : Text(
                widget.text,
                style: widget.textStyle ??
                    TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
              ),
      ),
    );
  }
}
