import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/providers/founders_provider.dart';
import 'package:globout/features/friends/presentation/views/add_friends_view/widgets/add_friends_view_heading_widget.dart';
import 'package:globout/features/friends/presentation/views/add_friends_view/widgets/founder_tile_follow_button.dart';
import 'package:globout/util/resource/r.dart';

class AddFriendsFollowFounderWidget extends ConsumerStatefulWidget {
  const AddFriendsFollowFounderWidget({super.key});

  @override
  ConsumerState<AddFriendsFollowFounderWidget> createState() =>
      _AddFriendsFollowFounderWidgetState();
}

class _AddFriendsFollowFounderWidgetState
    extends ConsumerState<AddFriendsFollowFounderWidget> {
  @override
  Widget build(BuildContext context) {
    final founders = ref.watch(foundersProvider);

    if (founders.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        /// [Follow]
        const AddFriendsViewHeadingWidget(
          title: "Follow",
        ),

        8.hb,

        for (final founder in founders)
          Container(
            width: 346.w,
            margin: EdgeInsets.only(bottom: 11.h),
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            decoration: BoxDecoration(
              color: R.colors.jetBlack_FF2E2E2E,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                /// [Avatar]
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56.r),
                    border: Border.all(
                      color: R.colors.yellow_FFFFCD52,
                      width: 1.w,
                    ),
                  ),
                  child: founder.imgUrl.isEmpty
                      ? CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: R.colors.white_FFF5F5F5,
                            size: 32.sp,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(56.r),
                          child: Image.network(
                            founder.imgUrl,
                            width: 52.r,
                            height: 52.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),

                16.wb,

                /// [Name and text]
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// [Name]
                    Text(
                      "Founders",
                      style: TextStyle(
                        color: R.colors.cyan_FF00C2B7,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    5.hb,

                    /// [Text]
                    Text(
                      "Lorem Ipsum is simply",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: R.colors.cyan_FF00C2B7,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// [Add button]
                FounderTileFollowButton(founderId: founder.id),
              ],
            ),
          ),
      ],
    );
  }
}
