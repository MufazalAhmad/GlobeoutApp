import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/onboarding/presentation/providers/terms_accepted_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsDialog extends ConsumerStatefulWidget {
  const TermsAndConditionsDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<TermsAndConditionsDialog> createState() =>
      _TermsAndConditionsDialogState();
}

class _TermsAndConditionsDialogState
    extends ConsumerState<TermsAndConditionsDialog> {
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
    return AlertDialog(
      title: Center(
        child: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          fontSize: 12.sp,
        ),
      ),
      actions: [
        Center(
          child: Column(
            children: [
              SizedBox(
                width: 240.w,
                height: 54.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(R.colors.purple_FF6C5DD3),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(240.r),
                      ),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    final terms =
                        ref.read(termsAcceptedProvider.notifier).terms;

                    if (!terms.accepted) {
                      ref.read(termsAcceptedProvider.notifier).acceptToggle();
                    }
                  },
                  child: Text(
                    "Accept & Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              20.hb,
            ],
          ),
        ),
      ],
    );
  }
}
