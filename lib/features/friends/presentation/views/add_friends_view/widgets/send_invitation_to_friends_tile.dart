import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../util/router/paths.dart';

class SendInvitationToFriendsTile extends StatelessWidget {
  const SendInvitationToFriendsTile({super.key});

  Future<void> onInviteFriends(BuildContext context) async {
    GoRouter.of(context).push(RoutePaths.contactsView);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      margin: EdgeInsets.only(bottom: 11.h),
      padding: EdgeInsets.only(left: 22.w, right: 7.w, top: 22.h, bottom: 22.h),
      decoration: BoxDecoration(
        color: R.colors.jetBlack_FF2E2E2E,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          /// [Friends Icon]
          SvgPicture.asset(R.svgs.SHARE_FRIENDS),

          10.wb,

          /// [Text]
          Text(
            "Send Invitation to Friends",
            style: TextStyle(
              color: R.colors.white_FFF5F5F5,
              fontSize: 12.sp,
            ),
          ),

          const Spacer(),

          /// [Send Invite button]
          GestureDetector(
            onTap: () => onInviteFriends(context),
            child: Container(
              width: 108.w,
              height: 30.34.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: R.colors.lavenderBlue_FF966EC3,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(108.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Invite",
                    style: TextStyle(
                      color: R.colors.lavenderBlue_FF966EC3,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.h),
                    child: Icon(
                      Icons.send,
                      color: R.colors.lavenderBlue_FF966EC3,
                      size: 15.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
