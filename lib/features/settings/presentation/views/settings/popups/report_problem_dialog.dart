import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/settings/presentation/providers/report_form_provider.dart';
import 'package:globout/features/settings/presentation/providers/report_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class ReportProblemDialog extends ConsumerStatefulWidget {
  const ReportProblemDialog({
    super.key,
  });

  @override
  ConsumerState<ReportProblemDialog> createState() =>
      _ReportProblemDialogState();
}

class _ReportProblemDialogState extends ConsumerState<ReportProblemDialog> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitReport(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await ref.read(reportProvider.future);
        if (context.mounted) GoRouter.of(context).pop();
      } catch (e) {
        showError(context, "Something went wrong");
      }
    }
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                37.25.hb,

                /// [Heading]
                Text(
                  "Report a Problem",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: R.colors.jetBlack_FF2E2E2E,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                27.hb,

                /// [Report Text]
                TextFormField(
                  onChanged: (value) {
                    ref.read(reportFormProvider.notifier).setDescription(value);
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return "Description is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Your report description",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                    filled: true,
                    fillColor: R.colors.grey_FFE8E8E8,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.r),
                      borderSide: BorderSide(
                        color: R.colors.grey_FFE8E8E8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.r),
                      borderSide: BorderSide(
                        color: R.colors.grey_FFE8E8E8,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.r),
                      borderSide: BorderSide(
                        color: R.colors.grey_FFE8E8E8,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  ),
                ),

                18.hb,

                /// [Report Button]
                RadiusButton(
                  text: "Report",
                  color: R.colors.purple_FF6C5DD3,
                  width: double.infinity,
                  loadingEnabled: true,
                  onPressed: () => _submitReport(context, ref),
                ),

                32.hb,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
