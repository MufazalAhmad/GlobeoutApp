import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/features/activity/presentation/views/filters/activities_filter_sheet.dart';
import 'package:globout/features/activity/presentation/views/filters/filter_activities_widget.dart';
import 'package:globout/features/home/presentation/providers/current_user_event_provider.dart';
import 'package:globout/features/home/presentation/providers/events_view_type_provider.dart';
import 'package:globout/features/home/presentation/views/home_view/widgets/current_user_event_bar_widget.dart';
import 'package:globout/util/resource/r.dart';
import '../../../../../activity/presentation/providers/home_activity_form_dragger_is_open_provider.dart';
import '../../../../../activity/presentation/views/create_activity_view_form/create_activity_view_form.dart';
import '../../../../../activity/presentation/views/filters/visibility_activity_widget.dart';
import 'events_in_list_view.dart';
import 'main_map.dart';

class HomeMapView extends ConsumerWidget {
  const HomeMapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          /// [Map]
          const MainMapWidget(),

          /// [Events List]
          Consumer(
            builder: (context, ref, _) {
              final eventViewType = ref.watch(eventsViewTypeProvider);

              if (eventViewType.isList) {
                return const EventsInListView();
              } else {
                return const SizedBox();
              }
            },
          ),

          /// [Create Activity]
          const CreateActivityViewFormWidget(),

          /// [Header]
          SafeArea(
            child: Consumer(
              builder: (context, ref, _) {
                final userEvent = ref.watch(currentUserEventProvider);
                final isFormOpen =
                    ref.watch(homeActivityFormDraggerIsOpenProvider);

                if (userEvent != null && (!isFormOpen)) {
                  return CurrentUserEventBarWidget(event: userEvent);
                }

                return Container(
                  color: R.colors.charcoal_FF1A1A1A,
                  width: 1.sw,
                  height: 41.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What',
                        style: TextStyle(
                          color: R.colors.cyan_FF00C2B7,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        ' are you up to?',
                        style: TextStyle(
                          color: R.colors.white_FFF5F5F5,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          /// [Filter Widget]
          const FilterActivitiesWidget(),

          /// [Visibility Widget]
          const VisibilityActivityWidget(),

          /// [Top Padding Dark]
          Container(
            color: R.colors.charcoal_FF1A1A1A,
            width: 1.sw,
            height: MediaQuery.of(context).padding.top,
          ),

          /// [Sheet for Filters]
          const ActivitiesFilterSheet(),
        ],
      ),
    );
  }
}
