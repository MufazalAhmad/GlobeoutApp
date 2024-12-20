import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/friend_horizontal_card_widget.dart';

import '../../../../../../../util/resource/r.dart';
import '../../../../providers/get_all_friends_provider.dart';

class AddCloseFriendsListWidget extends ConsumerWidget {
  const AddCloseFriendsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsync = ref.watch(getAllFriendsProvider);

    if (!friendsAsync.hasValue) {
      return const SizedBox();
    }

    final friends = friendsAsync.value;

    if (friends != null && friends.isEmpty) {
      return SizedBox(
        height: 70.h,
        child: Center(
          child: Text(
            "No friends yet!",
            style: TextStyle(
              color: R.colors.white_FFFFFFFF,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 75.h,
      child: ListView.builder(
        itemCount: friends?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final friend = friends![index];
          return FriendHorizontalCardWidget(
            friend: friend,
          );
        },
      ),
    );
  }
}
