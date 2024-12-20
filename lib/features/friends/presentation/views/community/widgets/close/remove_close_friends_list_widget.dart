import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/friends/presentation/providers/get_close_friends_provider.dart';
import '../../../../../../../util/resource/r.dart';
import 'close_friend_vertical_card_widget.dart';

class RemoveCloseFriendsListWidget extends ConsumerWidget {
  const RemoveCloseFriendsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsync = ref.watch(getCloseFriendsProvider);

    if (!friendsAsync.hasValue) {
      return const SizedBox();
    }

    final friends = friendsAsync.value;

    if (friends != null && friends.isEmpty) {
      return SizedBox(
        height: 70.h,
        child: Center(
          child: Text(
            "No close friends yet!",
            style: TextStyle(
              color: R.colors.white_FFFFFFFF,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 300.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.h,
        ),
        itemCount: friends?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final friend = friends![index];
          return CloseFriendVerticalCardWidget(
            friend: friend,
          );
        },
      ),
    );
  }
}
