import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/widgets/app_linear_loader.dart';
import 'package:globout/features/friends/presentation/providers/globout_contact_friends_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'add_friends_globout_member_tile.dart';

class AddFriendsGloboutMembersListWidget extends ConsumerStatefulWidget {
  const AddFriendsGloboutMembersListWidget({super.key});

  @override
  ConsumerState<AddFriendsGloboutMembersListWidget> createState() =>
      _AddFriendsGloboutMembersListWidgetState();
}

class _AddFriendsGloboutMembersListWidgetState
    extends ConsumerState<AddFriendsGloboutMembersListWidget> {
  @override
  Widget build(BuildContext context) {
    final friends = ref.watch(globoutContactFriendsProvider);

    if (friends.value == null) {
      return const AppLinearLoader();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final friend in friends.value!)
            AddFriendsGloboutMemberTile(user: friend),
          if (friends.value?.isEmpty ?? true)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                "No contacts joined yet",
                style: TextStyle(
                  color: R.colors.white_FFF5F5F5.withOpacity(0.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
