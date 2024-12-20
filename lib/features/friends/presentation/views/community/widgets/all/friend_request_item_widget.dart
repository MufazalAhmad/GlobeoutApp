import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/app_outlined_button.dart';
import 'package:globout/features/friends/domain/models/user_request/user_request.dart';
import 'package:globout/features/friends/presentation/providers/accept_friend_request_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

import '../../../../providers/cancel_friend_request_provider.dart';

class FriendRequestItemWidget extends ConsumerStatefulWidget {
  const FriendRequestItemWidget({
    super.key,
    required this.request,
  });
  final UserRequest request;

  @override
  ConsumerState<FriendRequestItemWidget> createState() =>
      _FriendRequestItemWidgetState();
}

class _FriendRequestItemWidgetState
    extends ConsumerState<FriendRequestItemWidget> {
  Future<void> onAcceptTap() async {
    try {
      setState(() {
        isSendingRequest = true;
      });
      await ref.read(acceptFriendRequestProvider(widget.request).future);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
    } finally {
      setState(() {
        isSendingRequest = false;
      });
    }
  }

  Future<void> onCancelTap() async {
    try {
      setState(() {
        isSendingRequest = true;
      });
      await ref.read(cancelFriendRequestProvider(widget.request).future);
    } catch (e) {
      setState(() {
        isSendingRequest = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
    } finally {
      isSendingRequest = false;
    }
  }

  bool isSendingRequest = false;
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
            /// [Close Button]
            GestureDetector(
              onTap: () => onCancelTap(),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  size: 10.r,
                  color: R.colors.white_FFF5F5F5,
                ),
              ),
            ),

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
                    child: widget.request.user.imgUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: widget.request.user.imgUrl,
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
              widget.request.user.name ?? "App user",
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
            if (true)
              Text(
                "in your contacts",
                style: TextStyle(
                  color: R.colors.white_FFF5F5F5,
                  fontSize: 6.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

            7.44.hb,

            isSendingRequest
                ? SizedBox(
                    width: 10.r,
                    height: 10.r,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: R.colors.white_FFFFFFFF,
                        strokeWidth: 2.r,
                      ),
                    ),
                  )
                : AppOutlinedButton(
                    onPressed: () => onAcceptTap(),
                    text: "Accept",
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
