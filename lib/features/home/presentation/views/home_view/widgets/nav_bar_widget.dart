import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/features/home/domain/models/home_nav_bar_index.dart';
import 'package:globout/features/home/presentation/providers/nav_bar_tab_provider.dart';
import 'package:globout/util/resource/r.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: HomeNavBarIndex.values
          .map(
            (item) => GestureDetector(
              onTap: () {
                ref.read(navBarIndexProvider.notifier).change(item);
              },
              child: Column(
                children: [
                  /// [Image]
                  SvgPicture.asset(
                    item.image,
                    height: 36.r,
                    width: 36.r,
                    colorFilter: ColorFilter.mode(
                      R.colors.white_FFF5F5F5,
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  /// [Title]
                  Text(
                    item.name,
                    style: TextStyle(
                      color: R.colors.white_FFF5F5F5,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
