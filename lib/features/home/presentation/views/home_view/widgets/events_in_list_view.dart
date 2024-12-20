import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/bordered_chip_button.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/filtered_event_models_provider.dart';
import 'package:globout/features/activity/presentation/providers/selected_activities_for_filter_provider.dart';
import 'package:globout/features/home/presentation/views/home_view/pop_ups/send_message_popup.dart';
import 'package:globout/features/home/presentation/views/home_view/widgets/event_item_tile.dart';

import '../../../../../../util/resource/r.dart';

class EventsInListView extends StatefulWidget {
  const EventsInListView({super.key});

  @override
  State<EventsInListView> createState() => _EventsInListViewState();
}

class _EventsInListViewState extends State<EventsInListView> {
  void onTapEventItem(EventModel event) {
    showDialog(
      context: context,
      builder: (context) => SendMessagePopup(event: event),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.colors.jetBlack_FF2E2E2E.withOpacity(0.8),
      child: Stack(
        children: [
          Column(
            children: [
              153.hb,
              Consumer(
                builder: (context, ref, _) {
                  final selectedChips =
                      ref.watch(selectedActivitiesForFilterProvider);
                  return Column(
                    children: [
                      Text(
                        selectedChips.allFriends
                            ? "All Friends"
                            : "Close Friends",
                        style: TextStyle(
                          color: R.colors.white_FFF5F5F5,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      8.hb,
                      SizedBox(
                        width: 390.w,
                        height: 30.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: selectedChips.activities
                              .map(
                                (activity) => BorderedChipButton(
                                  title: activity.title,
                                  color: activity.color,
                                  selected: activity.isSelected,
                                  onTap: () {
                                    ref
                                        .read(
                                            selectedActivitiesForFilterProvider
                                                .notifier)
                                        .select(activity);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  final events = ref.watch(filteredEventModelsProvider);

                  return Expanded(
                    child: events.isEmpty
                        ? Center(
                            child: Text(
                              "No activities yet!",
                              style: TextStyle(
                                color: R.colors.white_FFF5F5F5,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              ...List.from(events).map((e) {
                                final event = e;
                                return Column(
                                  children: [
                                    EventItemTile(
                                      event: event,
                                      onTap: () => onTapEventItem(event),
                                    ),

                                    /// [space between items]
                                    11.hb
                                  ],
                                );
                              }).toList(),

                              /// [bottom space]
                              97.hb,
                            ],
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
