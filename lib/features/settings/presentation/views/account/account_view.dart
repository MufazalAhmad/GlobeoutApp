import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/common/widgets/user_avatar_widget.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/settings/presentation/views/account/widgets/purple_gradient_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:globout/util/router/paths.dart';
import 'package:go_router/go_router.dart';

class AccountView extends ConsumerStatefulWidget {
  const AccountView({
    super.key,
  });

  @override
  ConsumerState<AccountView> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends ConsumerState<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.jetBlack_FF2E2E2E,
      body: SafeArea(
        child: Stack(
          children: [
            /// [Blue Radical Gradient]
            const PurpleGradientWidget(),

            Stack(
              children: [
                /// [Profile Background]
                Positioned(
                  top: 254.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Image.asset(R.pngs.PROFILE_BG),
                  ),
                ),

                /// [User Avatar]
                Positioned(
                  top: 132.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer(
                          builder: (context, ref, _) {
                            final user = ref.watch(userProvider);
                            return Padding(
                              padding: EdgeInsets.all(0.5.r),
                              child: Container(
                                height: 140.r,
                                width: 140.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: R.colors.jetBlack_FF2E2E2E,
                                ),
                                child: ClipOval(
                                  child: user != null &&
                                          (user.imgUrl.isNotEmpty ?? false)
                                      ? CachedNetworkImage(
                                          imageUrl: user.imgUrl,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                              value, downloadProgress) {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: R.colors.white_FFF5F5F5,
                                                value:
                                                    downloadProgress.progress,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                /// [Body]
                Positioned(
                  top: 314.h,
                  left: 65.w,
                  right: 65.w,
                  child: Consumer(builder: (context, ref, _) {
                    final user = ref.watch(userProvider);

                    return Column(
                      children: [
                        /// [Name]
                        Text(
                          user!.name!,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: R.colors.white_FFF5F5F5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        10.hb,

                        // /// [Location]
                        // Text(
                        //   "Romania, Bucarest",
                        //   style: TextStyle(
                        //     fontSize: 13.sp,
                        //     color: R.colors.white_FFF5F5F5,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),

                        // 10.hb,

                        // Text(
                        //   "louizemnr",
                        //   style: TextStyle(
                        //     fontSize: 13.sp,
                        //     color: R.colors.white_FFF5F5F5,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),

                        24.hb,

                        /// [Filled Buttons]
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// [Edit Profile Button]
                            RadiusButton(
                              text: "Edit Profile",
                              textStyle: TextStyle(fontSize: 15.sp),
                              color: R.colors.orchid_FFDE6CBA,
                              borderRadius: 11.r,
                              width: 124.w,
                              height: 35.h,
                              onPressed: () => GoRouter.of(context)
                                  .push(RoutePaths.updateProfileView),
                            ),

                            /// [Settings Button]
                            RadiusButton(
                              text: "Settings",
                              textStyle: TextStyle(fontSize: 15.sp),
                              color: R.colors.orchid_FFDE6CBA,
                              borderRadius: 11.r,
                              width: 124.w,
                              height: 35.h,
                              onPressed: () => GoRouter.of(context)
                                  .push(RoutePaths.settingsView),
                            ),
                          ],
                        ),

                        24.hb,

                        /// [Social Icons]
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// [Instagram Icon]
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: SizedBox(
                                height: 35.r,
                                width: 35.r,
                                child: SvgPicture.asset(
                                  R.svgs.INSTAGRAM_ICON,
                                ),
                              ),
                            ),

                            22.wb,

                            /// [LinkedIn Icon]
                            SizedBox(
                              height: 35.r,
                              width: 35.r,
                              child: SvgPicture.asset(
                                R.svgs.LINKEDIN_ICON,
                              ),
                            )
                          ],
                        ),

                        41.hb,

                        /// [Wishes Button]
                        RadiusButton(
                          text: "Wishes?",
                          textStyle: TextStyle(fontSize: 15.sp),
                          color: R.colors.orchid_FFDE6CBA,
                          borderRadius: 11.r,
                          height: 35.h,
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
