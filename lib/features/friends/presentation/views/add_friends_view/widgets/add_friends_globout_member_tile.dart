import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:globout/features/friends/presentation/providers/add_friend_provider.dart';
import 'package:globout/util/resource/r.dart';

class AddFriendsGloboutMemberTile extends ConsumerStatefulWidget {
  final User user;

  const AddFriendsGloboutMemberTile({super.key, required this.user});

  @override
  ConsumerState<AddFriendsGloboutMemberTile> createState() =>
      _AddFriendsGloboutMemberTileState();
}

class _AddFriendsGloboutMemberTileState
    extends ConsumerState<AddFriendsGloboutMemberTile> {
  late bool _isAdded;

  Future<void> setAdded() async {
    if (_isAdded) return;
    setState(() {
      _isAdded = true;
    });

    try {
      await ref.read(addFriendProvider(widget.user.id).future);
    } on String catch (e) {
      showError(e);
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
    super.initState();
    _isAdded = widget.user.added ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      margin: EdgeInsets.only(bottom: 11.h),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: R.colors.jetBlack_FF2E2E2E,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          /// [Avatar]

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
                  child: widget.user.imgUrl != null &&
                          widget.user.imgUrl.isNotEmpty
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

          16.wb,

          /// [Name and text]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// [Name]
              Text(
                widget.user.name ?? "",
                style: TextStyle(
                  color: R.colors.lavenderBlue_FF966EC3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              5.hb,

              /// [Text]
              Text(
                "In your contacts",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: R.colors.white_FFF5F5F5,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// [Add button]
          GestureDetector(
            onTap: setAdded,
            child: Container(
              width: 108.w,
              height: 30.34.h,
              decoration: BoxDecoration(
                color: _isAdded ? R.colors.lavenderBlue_FF966EC3 : null,
                border: !_isAdded
                    ? Border.all(
                        color: R.colors.lavenderBlue_FF966EC3,
                        width: 1.w,
                      )
                    : null,
                borderRadius: BorderRadius.circular(108.r),
              ),
              child: Center(
                child: Text(
                  _isAdded ? "Invited" : "Invite",
                  style: TextStyle(
                    color: R.colors.white_FFF5F5F5,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
