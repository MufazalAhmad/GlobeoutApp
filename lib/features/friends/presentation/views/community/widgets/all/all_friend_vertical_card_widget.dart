import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/app_outlined_button.dart';
import 'package:globout/features/friends/presentation/providers/unfriend_friend_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../auth/domain/models/user/user.dart';

class AllFriendVerticalCardWidget extends ConsumerStatefulWidget {
  const AllFriendVerticalCardWidget({
    super.key,
    required this.friend,
  });

  final User friend;

  @override
  ConsumerState<AllFriendVerticalCardWidget> createState() =>
      _FriendVerticalCardWidgetState();
}

class _FriendVerticalCardWidgetState
    extends ConsumerState<AllFriendVerticalCardWidget> {
  bool isLoading = false;

  Future<void> onUnfriendTap() async {
    try {
      setState(() {
        isLoading = true;
      });
      await ref.read(unFriendProvider(widget.friend.id).future);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        width: 105.6.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.4.r),
          color: R.colors.jetBlack_FF2E2E2E,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            5.hb,

            /// [Image]
            Container(
              height: 52.r,
              width: 52.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: R.colors.orange_FFFF9A00,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1.5.r,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0.r),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: R.colors.white_FFF5F5F5,
                  ),
                  child: ClipOval(
                    child: widget.friend.imgUrl != null &&
                            widget.friend.imgUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: widget.friend.imgUrl,
                            height: 52.r,
                            width: 52.r,
                            fit: BoxFit.cover,
                            errorWidget: (context, value, _) => const Center(
                              child: Icon(Icons.person),
                            ),
                          )
                        : const Center(
                            child: Icon(Icons.person),
                          ),
                  ),
                ),
              ),
            ),
            7.64.hb,

            /// [Name]
            Text(
              widget.friend.name ?? "App user",
              style: TextStyle(
                color: R.colors.purple_FF966EC3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),

            2.hb,

            /// [In your Contacts]
            /// [Text]
            // if (!isFriend)
            Text(
              "in your contacts",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 6.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            7.44.hb,

            /// [Unfriend Button]
            isLoading
                ? SizedBox(
                    width: 10.r,
                    height: 10.r,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: R.colors.white_FFFFFFFF,
                        strokeWidth: 0.7.r,
                      ),
                    ),
                  )
                : AppOutlinedButton(
                    onPressed: onUnfriendTap,
                    text: "Unfriend",
                    width: 67.7.w,
                    height: 20.h,
                    fontSize: 7.5,
                  )
          ],
        ),
      ),
    );
  }
}
