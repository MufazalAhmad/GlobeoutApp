import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/auth/domain/models/country/country.dart';
import 'package:globout/features/auth/presentation/providers/selected_country_provider.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class CountrySelectorWidget extends ConsumerWidget {
  final List<Country> countries;

  const CountrySelectorWidget({
    super.key,
    required this.countries,
  });

  Future<void> onSelect(
      WidgetRef ref, BuildContext context, Country country) async {
    ref.read(selectedCountryProvider.notifier).setCountry(country);
    await Future.delayed(const Duration(milliseconds: 200));

    if (context.mounted) {
      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectedCountryProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 400.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: R.colors.white_FFF5F5F5,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            10.hb,
            Text(
              "Select Country",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  final isSelected = selectedCountry?.code == country.code;

                  return GestureDetector(
                    onTap: () => onSelect(ref, context, country),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? R.colors.cyan_FF00C2B7.withOpacity(0.1)
                            : R.colors.white_FFF5F5F5,
                        border: Border.all(
                          color: isSelected
                              ? R.colors.cyan_FF00C2B7.withOpacity(0.6)
                              : R.colors.white_FFF5F5F5,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(9.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: Row(
                        children: [
                          20.wb,
                          Text(
                            country.flag,
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          10.wb,
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              country.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: R.colors.jetBlack_FF2E2E2E,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            country.code,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: R.colors.jetBlack_FF2E2E2E,
                            ),
                          ),
                          20.wb,
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
