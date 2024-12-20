import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/friend_request_item_widget.dart';

import '../../../../../../../util/resource/r.dart';
import '../../../../providers/recieved_friend_requests_provider.dart';

class FriendRequestsListWidget extends ConsumerWidget {
  const FriendRequestsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsRequestsAsync = ref.watch(getReceivedFriendsRequestsProvider);

    if (!friendsRequestsAsync.hasValue) {
      return const SizedBox();
    }

    final friendsRequests = friendsRequestsAsync.value;

    if (friendsRequests != null && friendsRequests.isEmpty) {
      return SizedBox(
        height: 70.h,
        child: Center(
          child: Text(
            "No received friend request yet!",
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
      height: 150.h,
      child: ListView.builder(
        itemCount: friendsRequests?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final friendRequest = friendsRequests![index];
          return FriendRequestItemWidget(
            request: friendRequest,
          );
        },
      ),
    );
  }
}
