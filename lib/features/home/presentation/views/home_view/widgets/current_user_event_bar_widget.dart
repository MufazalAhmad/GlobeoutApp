import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/matched_activity_provider.dart';

import '../../../../../../util/resource/r.dart';

class CurrentUserEventBarWidget extends ConsumerWidget {
  const CurrentUserEventBarWidget({super.key, required this.event});

  final EventModel event;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(matchedActivityProvider(event));
    return Container(
      color: R.colors.charcoal_FF1A1A1A,
      height: 42.h,
      width: 1.sw,
      child: Row(
        children: [
          SizedBox(width: 26.w),

          /// [user image]
          Container(
            height: 42.r,
            width: 42.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activity.color,
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0.r),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: R.colors.jetBlack_FF2E2E2E,
                ),
                child: ClipOval(
                  child: event.user.imgUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: event.user.imgUrl,
                          height: 52.r,
                          width: 52.r,
                          fit: BoxFit.cover,
                          errorWidget: (context, value, _) {
                            return Padding(
                              padding: EdgeInsets.all(12.r),
                              child: Image.asset(R.pngs.AVATAR),
                            );
                          },
                        )
                      : Padding(
                          padding: EdgeInsets.all(9.r),
                          child: Image.asset(
                            R.pngs.AVATAR,
                            height: 24.r,
                            width: 24.r,
                            color: R.colors.white_FFF5F5F5,
                          ),
                        ),
                ),
              ),
            ),
          ),

          SizedBox(width: 49.w),

          /// [text]
          Text(
            'I am up for',
            style: TextStyle(
              color: R.colors.white_FFF5F5F5,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),

          SizedBox(width: 10.w),

          /// [activity icon]
          Container(
            height: 34.h,
            width: 56.w,
            padding: EdgeInsets.all(5.73.r),
            decoration: BoxDecoration(
              color: activity.color,
              borderRadius: BorderRadius.all(
                Radius.circular(25.7.r),
              ),
              border: Border.all(color: activity.color),
            ),
            child: SvgPicture.asset(
              activity.icon,
              width: 17.r,
              height: 24.r,
              colorFilter: ColorFilter.mode(
                R.colors.white_FFFFFFFF,
                BlendMode.srcIn,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
