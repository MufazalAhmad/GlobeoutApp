import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/home/presentation/providers/selected_cluster_provider.dart';
import 'package:globout/features/home/presentation/views/home_view/pop_ups/send_message_popup.dart';

class ListViewForClusterSendMessageCards extends ConsumerStatefulWidget {
  const ListViewForClusterSendMessageCards({super.key});

  @override
  ConsumerState<ListViewForClusterSendMessageCards> createState() =>
      _ListViewForClusterSendMessageCardsState();
}

class _ListViewForClusterSendMessageCardsState
    extends ConsumerState<ListViewForClusterSendMessageCards> {
  @override
  Widget build(BuildContext context) {
    final cluster = ref.watch(selectedClusterProvider);
    return Positioned(
      bottom: 100.h,
      child: cluster.isEmpty
          ? const SizedBox()
          : TapRegion(
              onTapOutside: (_) {
                ref.read(selectedClusterProvider.notifier).remove();
              },
              child: SizedBox(
                height: 300.h,
                width: 390.w,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: cluster.length,
                  itemBuilder: (context, index) {
                    final event = cluster[index];
                    return SendMessagePopup(event: event);
                  },
                ),
              ),
            ),
    );
  }
}
