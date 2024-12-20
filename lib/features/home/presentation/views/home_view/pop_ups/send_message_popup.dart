import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/matched_activity_provider.dart';
import 'package:globout/features/home/presentation/providers/calculate_distance_provider_with_units_from_current_location.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../util/exceptions/exceptions.dart';
import '../../../../../../util/resource/r.dart';
import '../../../providers/send_message_provider.dart';

class SendMessagePopup extends ConsumerWidget {
  const SendMessagePopup({super.key, required this.event});

  final EventModel event;

  Future<void> sendMessage(BuildContext context, WidgetRef ref) async {
    try {
      GoRouter.of(context).pop();
      await ref.read(sendMessageProvider(event.user.phNumber).future);
    } on CouldNotLaunchUrlException {
      showError(context, "Could not send Message");
    } on WhatsappNotFoundException catch (e) {
      showError(context, e.message.toString());
    } catch (e) {
      showError(context, "Something went wrong");
    }
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(matchedActivityProvider(event));
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Container(
        height: 229.h,
        width: 344.w,
        decoration: BoxDecoration(
          color: R.colors.white_FFFFFFFF,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  SizedBox(height: 28.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// [user image]
                      Container(
                        height: 100.r,
                        width: 100.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: R.colors.pink_FFDE6CBA,
                            strokeAlign: BorderSide.strokeAlignInside,
                            width: 1.w,
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
                              child: event.user.imgUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: event.user.imgUrl,
                                      height: 100.r,
                                      width: 100.r,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, value, downloadProgress) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: R.colors.purple_FF6C5DD3,
                                          ),
                                        );
                                      },
                                      errorWidget: (context, value, _) {
                                        return const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                          ),
                                        );
                                      },
                                    )
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emblem-person-red.svg/1024px-Emblem-person-red.svg.png",
                                    ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 18.w),

                      Consumer(builder: (context, ref, _) {
                        final distance = ref.watch(
                          calculateDistanceProviderWithUnitsFromCurrentLocation(
                            LatLng(event.lat, event.lng),
                          ),
                        );
                        return Expanded(
                          child: SizedBox(
                            height: 105.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6.h),

                                /// [user name]
                                SizedBox(
                                  height: 30.h,
                                  child: Text(
                                    event.user.name ?? "App user",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: R.colors.purple_FF966EC3,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),

                                /// [content]
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "is $distance away to drink ",
                                        style: TextStyle(
                                          color: R.colors.jetBlack_FF2E2E2E,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "coffee",
                                        style: TextStyle(
                                          color: R.colors.pink_FFCF6BBC,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Spacer(),

                                Row(
                                  children: [
                                    /// [activity icon]
                                    Container(
                                      height: 32.h,
                                      width: 32.w,
                                      padding: EdgeInsets.all(6.5.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: activity.color,
                                      ),
                                      child: SvgPicture.asset(
                                        activity.icon,
                                        width: 23.r,
                                        height: 23.r,
                                        colorFilter: ColorFilter.mode(
                                          R.colors.white_FFFFFFFF,
                                          BlendMode.srcIn,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),

                                    SizedBox(width: 9.w),

                                    /// [Location Distance]
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 33.h,
                                        padding: EdgeInsets.all(6.5.r),
                                        decoration: BoxDecoration(
                                          color: R.colors.black_FF434343,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.7.r),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            /// [location icon]
                                            SvgPicture.asset(
                                              R.svgs.LOCATION,
                                              width: 24.r,
                                              height: 24.r,
                                              fit: BoxFit.contain,
                                            ),

                                            SizedBox(width: 4.6.w),

                                            /// [Distance]
                                            Text(
                                              distance,
                                              style: TextStyle(
                                                color: R.colors.white_FFFFFFFF,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 28.h),

                  /// [send button]
                  GestureDetector(
                    onTap: () => sendMessage(context, ref),
                    child: Container(
                      height: 48.h,
                      width: 280.w,
                      margin: EdgeInsets.symmetric(horizontal: 9.w),
                      padding: EdgeInsets.all(6.5.r),
                      decoration: BoxDecoration(
                        color: R.colors.purple_FF966EC3,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.7.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// [send icon]
                          SvgPicture.asset(
                            R.svgs.SEND_MEESAGE,
                            width: 29.r,
                            height: 29.r,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 4.8.w),

                          /// [send message text]
                          Text(
                            "Send Message",
                            style: TextStyle(
                              color: R.colors.white_FFFFFFFF,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// [cross button]

            Positioned(
              top: 12.h,
              right: 11.w,
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Container(
                  height: 24.r,
                  width: 24.r,
                  decoration: BoxDecoration(
                      color: R.colors.black_FF434343, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    R.svgs.X_CIRCLE,
                    height: 24.r,
                    width: 24.r,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
