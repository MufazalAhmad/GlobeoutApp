import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/app_outlined_button.dart';
import 'package:globout/util/resource/r.dart';

import '../../../../../../auth/domain/models/user/user.dart';
import '../../../../providers/add_friend_provider.dart';

class GloboutFriendHorizontalCardWidget extends ConsumerStatefulWidget {
  const GloboutFriendHorizontalCardWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  ConsumerState<GloboutFriendHorizontalCardWidget> createState() =>
      _GloboutFriendHorizontalCardWidgetState();
}

class _GloboutFriendHorizontalCardWidgetState
    extends ConsumerState<GloboutFriendHorizontalCardWidget> {
  late bool _isAdded;

  Future<void> setAdded() async {
    if (_isAdded) return;
    setState(() {
      _isAdded = true;
    });

    try {
      await ref.read(addFriendProvider(widget.user.id).future);
    } catch (e) {
      showError(e.toString());
      setState(() {
        _isAdded = false;
      });
    }
  }

  void showError(String error) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: R.colors.red_FFFF0D46,
        ),
      );
    }
  }

  @override
  void initState() {
    _isAdded = widget.user.added ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.49.w),
      child: Container(
        width: 161.3.w,
        height: 70.5.h,
        padding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.4.r),
          color: R.colors.jetBlack_FF2E2E2E,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                    child: (widget.user.imgUrl != null &&
                            widget.user.imgUrl.isNotEmpty)
                        ? CachedNetworkImage(
                            imageUrl: widget.user.imgUrl,
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
            8.wb,

            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// [Name]
                  Text(
                    widget.user.name ?? "App user",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.colors.purple_FF966EC3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),

                  3.hb,

                  /// [In your Contacts]
                  /// [Text]
                  Text(
                    "in your contacts",
                    style: TextStyle(
                      color: R.colors.white_FFF5F5F5,
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  4.hb,

                  /// [Add]
                  AppOutlinedButton(
                    onPressed: setAdded,
                    text: _isAdded ? "Invited" : "Invite",
                    width: 67.7.w,
                    height: 20.h,
                    fontSize: 7.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
