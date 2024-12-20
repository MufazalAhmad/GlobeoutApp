import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/matched_activity_provider.dart';
import 'package:globout/features/home/presentation/providers/calculate_distance_provider_with_units_from_current_location.dart';
import 'package:globout/util/time_ago/time_ago.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../util/resource/r.dart';

class EventItemTile extends ConsumerWidget {
  const EventItemTile({
    super.key,
    required this.event,
    required this.onTap,
  });

  final EventModel event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(matchedActivityProvider(event));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 346.w,
        height: 69.h,
        margin: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: R.colors.jetBlack_FF2E2E2E,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// [user image]
              Container(
                height: 56.r,
                width: 56.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activity.color,
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.0.r),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: R.colors.white_FFF5F5F5,
                    ),
                    child: ClipOval(
                      child: event.user.imgUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: event.user.imgUrl,
                              height: 52.r,
                              width: 52.r,
                              fit: BoxFit.cover,
                              errorWidget: (context, value, _) => const Center(
                                child: Icon(Icons.error_outline),
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emblem-person-red.svg/1024px-Emblem-person-red.svg.png",
                            ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// [user name]
                    Text(
                      event.user.name ?? "App user",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: R.colors.white_FFFFFFFF,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// [Time remaining to reach location]
                    Text(
                      timeAgoSinceDate(event.createdAt),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: R.colors.white_FFFFFFFF,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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

              SizedBox(width: 7.w),

              /// [Location Distance]
              Container(
                height: 35.h,
                padding: EdgeInsets.all(6.5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.7.r),
                  ),
                  border: Border.all(color: R.colors.cyan_FF00C2B7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// [location icon]
                    SvgPicture.asset(
                      R.svgs.LOCATION,
                      width: 24.r,
                      height: 24.r,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(width: 4.w),

                    /// [Distance remaining]
                    Consumer(
                      builder: (context, ref, _) {
                        final distance = ref.watch(
                          calculateDistanceProviderWithUnitsFromCurrentLocation(
                            LatLng(event.lat, event.lng),
                          ),
                        );
                        return Text(
                          distance,
                          style: TextStyle(
                            color: R.colors.white_FFFFFFFF,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
