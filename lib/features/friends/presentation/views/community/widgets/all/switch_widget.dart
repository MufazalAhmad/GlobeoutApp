import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/friends/presentation/providers/community_switch_provider.dart';
import 'package:globout/util/resource/r.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(builder: (context, ref, _) {
        final communitySwitch = ref.watch(communitySwitchProvider);

        return InkWell(
          onTap: () {
            ref.read(communitySwitchProvider.notifier).switchCommunity();
          },
          child: Stack(
            children: [
              Container(
                height: 32.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: R.colors.white_FFF5F5F5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "All",
                      style: TextStyle(
                        color: R.colors.jetBlack_FF2E2E2E,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Close",
                      style: TextStyle(
                        color: R.colors.jetBlack_FF2E2E2E,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                left: !communitySwitch ? 65.w : 0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: 32.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: R.colors.orchid_FFDE6CBA,
                  ),
                  child: Center(
                    child: Text(
                      communitySwitch ? "All" : "Close",
                      style: TextStyle(
                        color: R.colors.white_FFF5F5F5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
