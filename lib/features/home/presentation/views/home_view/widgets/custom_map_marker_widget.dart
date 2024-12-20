import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/features/activity/domain/models/activity.dart';
import 'package:globout/features/activity/domain/models/event.dart';
import 'package:globout/features/activity/presentation/providers/matched_activity_provider.dart';
import 'package:globout/features/home/presentation/providers/event_models_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../../../../util/resource/r.dart';

class CustomMapMarkerWidget extends ConsumerStatefulWidget {
  final EventModel event;

  const CustomMapMarkerWidget({
    super.key,
    required this.event,
  });

  @override
  ConsumerState<CustomMapMarkerWidget> createState() =>
      _CustomMapMarkerWidgetState();
}

class _CustomMapMarkerWidgetState extends ConsumerState<CustomMapMarkerWidget> {
  final controller = ScreenshotController();

  ActivityModel? lastBuildFor;

  Future<void> shot(ActivityModel activity) async {
    try {
      final icon =
          await controller.capture(delay: const Duration(milliseconds: 40));
      final event = widget.event;

      ref.read(eventModelsProvider.notifier).updateMarkerIcon(icon!, event);
      lastBuildFor = activity;
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      await shot(activity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final activity = ref.watch(matchedActivityProvider(widget.event));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (lastBuildFor == null ||
          lastBuildFor!.title != activity.title ||
          widget.event.markerImage == null) {
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          await shot(activity);
        }
      }
    });

    return Screenshot(
      controller: controller,
      child: SizedBox(
        height: 56,
        width: 70,
        child: Stack(
          children: [
            /// [user image]
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activity.color,
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: R.colors.white_FFF5F5F5,
                    ),
                    child: ClipOval(
                      child: EmptyAwareCachedNetworkImage(
                        url: widget.event.user.imgUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// [activity icon]
            Positioned(
              right: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: activity.color,
                  height: 24,
                  width: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      activity.icon,
                      color: R.colors.white_FFF5F5F5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClusterMapMarkerWidget extends ConsumerStatefulWidget {
  final List<EventModel> events;

  const ClusterMapMarkerWidget({
    super.key,
    required this.events,
  });

  @override
  ConsumerState<ClusterMapMarkerWidget> createState() =>
      _ClusterMapMarkerWidgetState();
}

class _ClusterMapMarkerWidgetState
    extends ConsumerState<ClusterMapMarkerWidget> {
  final controller = ScreenshotController();

  ActivityModel? lastBuildFor;

  Future<void> shot(ActivityModel activity) async {
    try {
      final icon =
          await controller.capture(delay: const Duration(milliseconds: 40));
      final event = widget.events;

      ref
          .read(eventModelsProvider.notifier)
          .updateMarkerIcon(icon!, event.first);
      lastBuildFor = activity;
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      await shot(activity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final activity = ref.read(matchedActivityProvider(widget.events.first));
    final activityLast = ref.read(matchedActivityProvider(widget.events.last));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (lastBuildFor == null ||
          lastBuildFor!.title != activity.title ||
          widget.events.first.markerImage == null) {
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          await shot(activity);
        }
      }
    });

    return Screenshot(
      controller: controller,
      child: SizedBox(
        height: 56,
        width: 70,
        child: Stack(
          children: [
            /// [Cluster Avatar]
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: activity.color),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.r),
                child: CircleAvatar(
                  backgroundColor: activityLast.color,
                  radius: 56,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: EmptyAwareCachedNetworkImage(
                          url: widget.events.first.user.imgUrl,
                          width: (56 / 2) - 4,
                          height: (56 / 2) - 4,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: EmptyAwareCachedNetworkImage(
                          url: widget.events.last.user.imgUrl,
                          width: (56 / 2) - 4,
                          height: (56 / 2) - 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// [Number of events in cluster]
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: activity.color,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.all(4.r),
                child: Text(
                  "+${widget.events.length}",
                  style: TextStyle(
                    color: R.colors.white_FFF5F5F5,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyAwareCachedNetworkImage extends StatelessWidget {
  final String url;

  const EmptyAwareCachedNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            height: height ?? 56,
            width: width ?? 56,
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            height: height ?? 56,
            width: width ?? 56,
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emblem-person-red.svg/1024px-Emblem-person-red.svg.png",
          );
  }
}
