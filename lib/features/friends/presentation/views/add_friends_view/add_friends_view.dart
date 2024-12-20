import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/views/add_friends_view/widgets/add_friends_view_heading_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';
import 'widgets/add_friends_follow_founder_widget.dart';
import 'widgets/add_friends_globout_members_list_widget.dart';
import 'widgets/add_friends_view_bg.dart';
import 'widgets/send_invitation_to_friends_tile.dart';

class AddFriendsView extends ConsumerStatefulWidget {
  const AddFriendsView({super.key});

  @override
  ConsumerState<AddFriendsView> createState() => _AddFriendsViewState();
}

class _AddFriendsViewState extends ConsumerState<AddFriendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            /// [BG]
            const AddFriendsViewBg(),

            /// [Body]
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              width: 1.sw,
              height: 1.sh,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// [Back]
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            color: R.colors.white_FFF5F5F5,
                            size: 32.sp,
                          ),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: R.colors.white_FFF5F5F5,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    8.hb,

                    /// [Already Globout ...]
                    const AddFriendsViewHeadingWidget(
                      title: "Already Globout members",
                    ),

                    8.hb,

                    const AddFriendsGloboutMembersListWidget(),

                    7.hb,

                    /// [Invite Contacts]
                    const AddFriendsViewHeadingWidget(title: "Invite Contacts"),

                    8.hb,

                    const SendInvitationToFriendsTile(),

                    1.hb,

                    const AddFriendsFollowFounderWidget(),

                    32.hb,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// [Skip Button]
                        GestureDetector(
                          onTap: () => GoRouter.of(context).pop(),
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
                            child: Center(
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  color: R.colors.lavenderBlue_FF966EC3,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        26.wb,

                        /// [Next Button]
                        GestureDetector(
                          onTap: () => GoRouter.of(context).pop(),
                          child: Container(
                            width: 108.w,
                            height: 30.34.h,
                            decoration: BoxDecoration(
                              color: R.colors.lavenderBlue_FF966EC3,
                              borderRadius: BorderRadius.circular(108.r),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: R.colors.white_FFF5F5F5,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
