import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/app_outlined_button.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

class SendInvitationCardWidget extends StatelessWidget {
  const SendInvitationCardWidget({super.key});

  Future<void> onInviteFriends(BuildContext context) async {
    GoRouter.of(context).push(RoutePaths.contactsView);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      height: 69.h,
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 21.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.4.r),
        color: R.colors.jetBlack_FF2E2E2E,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// [Share Friends Image]
          SvgPicture.asset(R.svgs.SHARE_FRIENDS),

          /// [Name]
          Text(
            "Send Invitation to Friends",
            style: TextStyle(
              color: R.colors.white_FFF5F5F5,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),

          2.hb,

          /// [Send Invite Button]
          AppOutlinedButton(
            onPressed: () => onInviteFriends(context),
            text: "Invite",
            width: 108.w,
            height: 30.h,
            fontSize: 7.5,
            textStyle: TextStyle(
              color: R.colors.purple_FF966EC3,
              fontSize: 12.sp,
            ),
            suffixIcon: Icon(
              Icons.send,
              color: R.colors.purple_FF966EC3,
              size: 12.r,
            ),
          )
        ],
      ),
    );
  }
}
