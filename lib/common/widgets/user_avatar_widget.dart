import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/util/resource/r.dart';

class UserAvatarWidget extends ConsumerWidget {
  const UserAvatarWidget({
    super.key,
    this.fileImage,
    this.hasBorder = true,
    this.radius,
  });

  final String? fileImage;
  final bool hasBorder;
  final double? radius;

  ImageProvider userImage(String? filePath, String? userImage) {
    if (filePath != null) {
      return FileImage(File(filePath));
    }

    if (userImage != null && userImage.isNotEmpty) {
      return CachedNetworkImageProvider(userImage);
    }

    return AssetImage(R.pngs.AVATAR);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Container(
      height: 140.r,
      width: 140.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            hasBorder ? R.colors.white_FFF5F5F5 : R.colors.transparent_FF000000,
      ),
      child: Padding(
        padding: EdgeInsets.all(0.5.r),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: R.colors.jetBlack_FF2E2E2E,
          ),
          child: ClipOval(
            child: fileImage != null
                ? Image.file(
                    File(fileImage!),
                    fit: BoxFit.fill,
                  )
                : user != null && (user.imgUrl.isNotEmpty ?? false)
                    ? CachedNetworkImage(
                        imageUrl: user.imgUrl,
                        height: 140.r,
                        width: 140.r,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, value, downloadProgress) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: R.colors.white_FFF5F5F5,
                              value: downloadProgress.progress,
                            ),
                          );
                        },
                        errorWidget: (context, value, _) {
                          return Padding(
                            padding: EdgeInsets.all(15.r),
                            child: Image.asset(R.pngs.AVATAR),
                          );
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Image.asset(R.pngs.AVATAR),
                      ),
          ),
        ),
      ),
    );
  }
}
