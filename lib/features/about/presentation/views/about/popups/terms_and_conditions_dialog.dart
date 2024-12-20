import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/util/resource/r.dart';

class TermsAndConditionsDialog extends StatefulWidget {
  const TermsAndConditionsDialog({
    super.key,
    this.showButton = true,
  });

  final bool showButton;

  @override
  State<TermsAndConditionsDialog> createState() =>
      _TermsAndConditionsDialogState();
}

class _TermsAndConditionsDialogState extends State<TermsAndConditionsDialog> {
  String content = '';

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  Future<void> loadContent() async {
    final loadedContent = await rootBundle.loadString(
      R.txts.TERMS_AND_CONDITIONS,
    );

    setState(() {
      content = loadedContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              37.25.hb,

              /// [Heading]
              Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: R.colors.jetBlack_FF2E2E2E,
                  fontWeight: FontWeight.w500,
                ),
              ),

              27.hb,

              /// [Details]
              Text(
                content,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: R.colors.jetBlack_FF2E2E2E,
                ),
                textAlign: TextAlign.center,
              ),

              10.hb,

              /// [Accept Button]
              if (widget.showButton)
                RadiusButton(
                  text: "Accept",
                  color: R.colors.orchid_FFDE6CBA,
                  width: double.infinity,
                ),

              25.hb,
            ],
          ),
        ),
      ),
    );
  }
}
