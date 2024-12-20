import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/auth/presentation/providers/all_coutries_provider.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/features/auth/presentation/providers/selected_country_provider.dart';
import 'package:globout/features/auth/presentation/views/enter_phone_view/dialogs/country_selector_widget.dart';
import 'package:globout/util/resource/r.dart';

class NumberPickerWidget extends ConsumerStatefulWidget {
  const NumberPickerWidget({super.key});

  @override
  ConsumerState<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends ConsumerState<NumberPickerWidget> {
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    final enteredPhone = ref.read(authFormModelProvider.notifier).phoneNumber;
    phoneController = TextEditingController(text: enteredPhone);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: Consumer(
        builder: (context, ref, _) {
          final countries = ref.watch(allCountriesProvider);
          final selectedCountry = ref.watch(selectedCountryProvider);

          if (!countries.hasValue) {
            return const SizedBox();
          }

          final value = countries.asData!.value;

          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        CountrySelectorWidget(countries: value),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 4.w,
                  ),
                  width: 65.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: R.colors.grey_FFE8E8E8,
                  ),
                  child: Row(
                    children: [
                      3.wb,
                      Text(
                        selectedCountry!.flag,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      2.wb,
                      Text(
                        selectedCountry.code,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: R.colors.jetBlack_FF2E2E2E.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 12.r,
                        color: R.colors.jetBlack_FF2E2E2E.withOpacity(0.5),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              9.wb,
              Expanded(
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: R.colors.grey_FFE8E8E8,
                  ),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      ref
                          .read(authFormModelProvider.notifier)
                          .setPhoneNumber(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter mobile number",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: R.colors.jetBlack_FF2E2E2E.withOpacity(0.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
