import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/bordered_check_button.dart';
import 'package:globout/common/widgets/bordered_chip_button.dart';
import 'package:globout/common/widgets/bottom_sheet_picker_button.dart';
import 'package:globout/features/activity/presentation/providers/activities_provider.dart';
import 'package:globout/features/activity/presentation/providers/create_activity_form_provider.dart';
import 'package:globout/features/activity/presentation/providers/create_activity_provider.dart';
import 'package:globout/features/activity/presentation/providers/home_activity_form_dragger_is_open_provider.dart';
import 'package:globout/features/activity/presentation/providers/update_event_provider.dart';
import 'package:globout/util/resource/r.dart';
import '../../../../home/presentation/providers/current_user_event_provider.dart';
import '../../providers/all_activities_create_activity_provider.dart';

class CreateActivityViewFormWidget extends ConsumerStatefulWidget {
  const CreateActivityViewFormWidget({super.key});

  @override
  ConsumerState<CreateActivityViewFormWidget> createState() =>
      _CreateActivityViewFormWidgetState();
}

class _CreateActivityViewFormWidgetState
    extends ConsumerState<CreateActivityViewFormWidget> {
  final GlobalKey myKey = GlobalKey();

  double get formHeight {
    final renderBox = myKey.currentContext?.findRenderObject() as RenderBox?;
    return (renderBox?.size.height ?? 0) - 81.h;
  }

  var opacity = 0.0;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  Future<void> submit(BuildContext context) async {
    try {
      String eventStatus;
      ref.read(createActivityFormProvider.notifier).validate();

      final userEvent = ref.read(currentUserEventProvider);
      if (userEvent != null) {
        /// [update event]
        await ref.read(updateEventProvider.future);

        eventStatus = "Update Successfully";
      } else {
        /// [create event]
        await ref.read(createActivityProvider.future);
        eventStatus = "Create Successfully";
      }

      ref.read(homeActivityFormDraggerIsOpenProvider.notifier).close();

      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text(eventStatus ?? ""))),
        );
      }
    } on String catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text("Something went wrong"))),
      );
    }
  }

  void _fillForm(WidgetRef ref) {
    final event = ref.read(currentUserEventProvider)!;
    final activities = ref.read(activitiesProvider);

    final formNotifier = ref.read(createActivityFormProvider.notifier);
    final selectActivitiesNotifier =
        ref.read(allActivitiesCreateActivityProvider.notifier);

    formNotifier.setForAllFriends(event.forAllFriends);
    formNotifier.setInHowManyMinutes(event.inMinutes);
    formNotifier.setForHowManyHours(event.forHours);

    final activity = activities.firstWhere((element) =>
        element.title.toLowerCase() == event.activities.first.toLowerCase());
    selectActivitiesNotifier.select(activity);
  }

  void _clearForm(WidgetRef ref) {
    ref.invalidate(createActivityFormProvider);
    ref.invalidate(allActivitiesCreateActivityProvider);
  }

  String minsOrHoursTitle(int value) {
    if (value == 0) {
      return "now";
    } else if (value > 59) {
      int hours = value ~/ 60; // Integer division to get the hours
      int minutes = value % 60; // Remaining minutes
      if (minutes > 0) {
        return "$hours ${hours > 1 ? "hours" : "hour"} $minutes mins";
      } else {
        return "$hours ${hours > 1 ? "hours" : "hour"}";
      }
    } else {
      return "$value mins";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFormOpen = ref.watch(homeActivityFormDraggerIsOpenProvider);
    final form = ref.watch(createActivityFormProvider);
    final userEvent = ref.watch(currentUserEventProvider);

    ref.listen(currentUserEventProvider, (previous, next) {
      if (previous != next && next != null) {
        _fillForm(ref);
      } else if (previous != next && next == null) {
        _clearForm(ref);
      }
    });

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: isFormOpen
          ? (MediaQuery.paddingOf(context).top + 40.5.h)
          : -formHeight,
      child: TapRegion(
        groupId: 1,
        onTapOutside: (_) {
          if (isFormOpen) {
            ref.read(homeActivityFormDraggerIsOpenProvider.notifier).close();
          }
        },
        child: Opacity(
          opacity: opacity,
          child: SizedBox(
            width: 1.sw,
            child: Column(
              children: [
                /// [Form Content]
                Container(
                  key: myKey,
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  color: R.colors.charcoal_FF1A1A1A,
                  width: 1.sw,
                  child: Column(
                    children: [
                      /// [Chips]
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 46.w),
                        child: Consumer(
                          builder: (context, ref, _) {
                            final activities =
                                ref.watch(allActivitiesCreateActivityProvider);

                            return Wrap(
                              alignment: WrapAlignment.center,
                              children: activities
                                  .map(
                                    (activity) => BorderedChipButton(
                                      title: activity.title,
                                      color: activity.color,
                                      selected: activity.isSelected,
                                      onTap: () {
                                        ref
                                            .read(
                                                allActivitiesCreateActivityProvider
                                                    .notifier)
                                            .select(activity);
                                      },
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),

                      /// [When do you want to go]
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'When',
                              style: TextStyle(
                                color: R.colors.cyan_FF00C2B7,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              ' do you want to go',
                              style: TextStyle(
                                color: R.colors.white_FFF5F5F5,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            )
                          ],
                        ),
                      ),

                      /// [Time and Duration pickers]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "In",
                            style: TextStyle(
                              color: R.colors.white_FFF5F5F5,
                            ),
                          ),
                          15.wb,

                          /// [In Time]
                          BottomSheetPickerButton<int>(
                            buttonTitle: Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 20.r,
                                ),
                                4.09.wb,
                                Text(
                                  form.inHowManyMinutes != null
                                      ? minsOrHoursTitle(form.inHowManyMinutes!)
                                      : "Select",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            showTitle: (value) {
                              return minsOrHoursTitle(value);
                            },
                            selected: (value) {
                              return value == form.inHowManyMinutes;
                            },
                            onChanged: (minutes) {
                              ref
                                  .read(createActivityFormProvider.notifier)
                                  .setInHowManyMinutes(minutes);
                            },
                            sheetTitle: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Start ',
                                      style: TextStyle(
                                        color: R.colors.cyan_FF00C2B7,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    Text(
                                      'in',
                                      style: TextStyle(
                                        color: R.colors.jetBlack_FF2E2E2E,
                                        fontSize: 22.sp,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            options: const [0, 15, 30, 45, 60, 90, 120],
                          ),

                          37.wb,
                          Text(
                            "For",
                            style: TextStyle(
                              color: R.colors.white_FFF5F5F5,
                            ),
                          ),
                          15.wb,

                          /// [For Time]
                          BottomSheetPickerButton<int>(
                            buttonTitle: Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 20.r,
                                ),
                                4.09.wb,
                                Text(
                                  form.forHowManyHours != null
                                      ? minsOrHoursTitle(form.forHowManyHours!)
                                      : "Select",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            showTitle: (value) {
                              return minsOrHoursTitle(value);
                            },
                            selected: (value) {
                              return value == form.forHowManyHours;
                            },
                            onChanged: (hours) {
                              ref
                                  .read(createActivityFormProvider.notifier)
                                  .setForHowManyHours(hours);
                            },
                            sheetTitle: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'How ',
                                      style: TextStyle(
                                        color: R.colors.cyan_FF00C2B7,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    Text(
                                      'much time will you spend?',
                                      style: TextStyle(
                                        color: R.colors.jetBlack_FF2E2E2E,
                                        fontSize: 22.sp,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            options: const [60, 120, 180, 240],
                          ),
                        ],
                      ),

                      /// [Who do you want to share]
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Who',
                              style: TextStyle(
                                color: R.colors.cyan_FF00C2B7,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              ' do you want to share that with?',
                              style: TextStyle(
                                color: R.colors.white_FFF5F5F5,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            )
                          ],
                        ),
                      ),

                      /// [Close friends and All friends chips check buttons]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BorderedCheckButton(
                            title: "Close Friends",
                            isChecked: !(form.forAllFriends ?? true),
                            onChanged: (value) {
                              ref
                                  .read(createActivityFormProvider.notifier)
                                  .setForAllFriends(false);
                            },
                          ),
                          3.2.wb,
                          BorderedCheckButton(
                            title: "All Friends",
                            isChecked: form.forAllFriends ?? false,
                            onChanged: (value) {
                              ref
                                  .read(createActivityFormProvider.notifier)
                                  .setForAllFriends(true);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                /// [Drag Point]
                GestureDetector(
                  onTap: () {
                    ref
                        .read(homeActivityFormDraggerIsOpenProvider.notifier)
                        .toggle();
                  },
                  child: SizedBox(
                    height: userEvent != null ? 56.h : 47.5.h,
                    child: Stack(
                      children: [
                        /// [Drag BG]
                        SizedBox(
                          height: 47.5.h,
                          width: 390.w,
                          child: SvgPicture.asset(
                            R.svgs.HOME_SCREEN_DRAGGER,
                            fit: BoxFit.cover,
                            color: R.colors.charcoal_FF1A1A1A,
                          ),
                        ),

                        /// [Add Icon]
                        Positioned(
                          top: isFormOpen ? 0 : 5.h,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: isFormOpen ? () => submit(context) : null,
                            child: Center(
                              child: Container(
                                width: isFormOpen ? 130.54.w : 23.33.r,
                                height: 23.33.r,
                                decoration: BoxDecoration(
                                  color: R.colors.white_FFF5F5F5,
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isFormOpen)
                                      Container(
                                        margin: EdgeInsets.only(right: 5.w),
                                        decoration: BoxDecoration(
                                          color: R.colors.charcoal_FF1A1A1A,
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: R.colors.white_FFF5F5F5,
                                          size: 18.r,
                                        ),
                                      )
                                    else
                                      Icon(
                                        Icons.add,
                                        color: R.colors.charcoal_FF1A1A1A,
                                        size: 18.r,
                                      ),
                                    if (isFormOpen)
                                      Text(userEvent == null
                                          ? "Create Event"
                                          : "Update Event")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
