import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/providers/community_switch_provider.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/all_friends_tab_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/search_friends_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/bg_blue_gradient_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/close/close_friends_tab_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/purple_radical_gradient_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/all/switch_widget.dart';
import 'package:globout/util/resource/r.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// [BG Gradient]
          const BgBlueGradientWidget(),

          /// [Blue Radical Gradient]
          const PurpleRadialGradientWidget(),

          /// [Body]
          SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.hb,

                  /// [Heading]
                  /// [Your Friends]
                  Center(
                    child: Text(
                      "Your Friends",
                      style: TextStyle(
                        color: R.colors.white_FFF5F5F5,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  16.hb,

                  /// [Toggle] for All and Close Friends
                  const SwitchWidget(),

                  12.hb,

                  /// [Search]
                  Center(child: SearchFriendsWidget()),

                  11.hb,

                  /// [Body]
                  /// if tab [All] is selected [AllFriendTabWidget] will be shown
                  /// else [CloseFriendsTabWidget] will be shown
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, _) {
                        final communitySwitch =
                            ref.watch(communitySwitchProvider);

                        if (communitySwitch) {
                          return const AllFriendsTabWidget();
                        }

                        return const CloseFriendsTabWidget();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
