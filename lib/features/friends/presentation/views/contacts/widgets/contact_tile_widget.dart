import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/domain/models/contact/contact.dart';
import 'package:globout/features/friends/presentation/providers/send_sms_provider.dart';
import 'package:globout/util/resource/r.dart';

class ContactTileWidget extends ConsumerStatefulWidget {
  final ContactModel user;

  const ContactTileWidget({super.key, required this.user});

  @override
  ConsumerState<ContactTileWidget> createState() => _ContactTileWidgetState();
}

class _ContactTileWidgetState extends ConsumerState<ContactTileWidget> {
  Future<void> sendSms() async {
    try {
      if (widget.user.phones.isNotEmpty) {
        await ref.read(sendSmsProvider(widget.user.phones.first).future);
      } else {
        showError("Contact missing phone number.");
      }
    } on String catch (e) {
      showError("Something went wrong");
    }
  }

  void showError(String error) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: R.colors.red_FFFF0D46,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      margin: EdgeInsets.only(bottom: 11.h),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: R.colors.jetBlack_FF2E2E2E,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          /// [Avatar]

          Container(
            height: 52.r,
            width: 52.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: R.colors.orange_FFFF9A00,
                strokeAlign: BorderSide.strokeAlignInside,
                width: 1.5.r,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0.r),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: R.colors.white_FFF5F5F5,
                ),
                child: const ClipOval(
                  child: Center(
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
          ),

          16.wb,

          /// [Name and text]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// [Name]
              SizedBox(
                width: 130.w,
                child: Text(
                  widget.user.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.lavenderBlue_FF966EC3,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              5.hb,

              /// [Text]
              Text(
                "In your contacts",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: R.colors.white_FFF5F5F5,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// [invite button]
          GestureDetector(
            onTap: () => sendSms(),
            child: Container(
              width: 108.w,
              height: 30.34.h,
              decoration: BoxDecoration(
                color: R.colors.lavenderBlue_FF966EC3,
                border: Border.all(
                  color: R.colors.lavenderBlue_FF966EC3,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(108.r),
              ),
              child: Center(
                child: Text(
                  "Invite",
                  style: TextStyle(
                    color: R.colors.white_FFF5F5F5,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
