import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/all_friends_list_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/friend_requests_list_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/globout_members_list_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/send_invitation_card_widget.dart';

import '../../../../../../../util/resource/r.dart';

class AllFriendsTabWidget extends StatelessWidget {
  const AllFriendsTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Friend Requests]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Friend Requests",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          8.hb,

          /// [Friend Requests List]
          const FriendRequestsListWidget(),

          10.hb,

          /// [Friend Requests]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "All Friends",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          8.hb,

          /// [All Friends]
          const AllFriendsListWidget(),

          10.hb,

          /// [Already Globout Members]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Already Globout Members",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          5.hb,

          /// [Globout Memebers List]
          const GloboutMembersListWidget(),

          33.hb,

          /// [Invite Contacts]
          Center(
            child: Text(
              "Invite Contacts",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          8.hb,

          /// [Invite Friends Card]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: const SendInvitationCardWidget(),
          ),

          154.hb,
        ],
      ),
    );
  }
}
