import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/user_connection_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/presentation/providers/globout_contact_friends_provider.dart';

import '../../../../../../../util/resource/r.dart';
import 'globout_friend_horizontal_card_widget.dart';

class GloboutMembersListWidget extends ConsumerWidget {
  const GloboutMembersListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userConnectionProvider).value;
    final globOutMembersAsync = ref.watch(globoutContactFriendsProvider);

    if (!globOutMembersAsync.hasValue) {
      return SizedBox(
        height: 80.h,
        child: Center(
          child: SizedBox(
            height: 20.r,
            width: 20.r,
            child: CircularProgressIndicator(
              color: R.colors.white_FFFFFFFF,
              strokeWidth: 1.5.r,
            ),
          ),
        ),
      );
    }

    final globOutMembers = globOutMembersAsync.value;

    if (globOutMembers != null && globOutMembers.isEmpty) {
      return SizedBox(
        height: 70.h,
        child: Center(
          child: Text(
            "No member found",
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
      height: 70.5.h,
      child: ListView.builder(
        itemCount: globOutMembers?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final user = globOutMembers![index];

          return GloboutFriendHorizontalCardWidget(
            user: user,
          );
        },
      ),
    );
  }
}
