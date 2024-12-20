import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/friends/presentation/providers/founders_provider.dart';
import 'package:globout/util/resource/r.dart';

class FounderTileFollowButton extends ConsumerStatefulWidget {
  final String founderId;

  const FounderTileFollowButton({
    super.key,
    required this.founderId,
  });

  @override
  ConsumerState<FounderTileFollowButton> createState() =>
      _FounderTileFollowButtonState();
}

class _FounderTileFollowButtonState
    extends ConsumerState<FounderTileFollowButton> {
  @override
  Widget build(BuildContext context) {
    final founder = ref.watch(foundersProvider.select((value) =>
        value.where((element) => element.id == widget.founderId).first));

    final currentUser = ref.watch(userProvider)!;

    final bool isFollowed = founder.isFollowed(currentUser.id);

    return GestureDetector(
      onTap: () {
        ref.read(foundersProvider.notifier).switchFollow(
              from: currentUser.id,
              to: widget.founderId,
            );
      },
      child: Container(
        width: 108.w,
        height: 30.34.h,
        decoration: BoxDecoration(
          color: isFollowed ? R.colors.cyan_FF00C2B7 : null,
          border: !isFollowed
              ? Border.all(
                  color: R.colors.cyan_FF00C2B7,
                  width: 1.w,
                )
              : null,
          borderRadius: BorderRadius.circular(108.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFollowed ? "Followed" : "Follow",
              style: TextStyle(
                color: isFollowed
                    ? R.colors.white_FFF5F5F5
                    : R.colors.cyan_FF00C2B7,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
