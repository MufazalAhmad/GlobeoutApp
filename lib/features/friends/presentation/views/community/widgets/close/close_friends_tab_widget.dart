import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/close/add_close_friends_list_widget.dart';
import 'package:globout/features/friends/presentation/views/community/widgets/close/remove_close_friends_list_widget.dart';

import '../../../../../../../util/resource/r.dart';

class CloseFriendsTabWidget extends StatelessWidget {
  const CloseFriendsTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Close Friends]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Close Friends",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          8.hb,

          /// [Close Friends List]
          const RemoveCloseFriendsListWidget(),

          10.hb,

          /// [Add Close Friends]
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Add Close Friends",
              style: TextStyle(
                color: R.colors.white_FFF5F5F5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          5.hb,

          /// [Add Close Friends List]
          const AddCloseFriendsListWidget(),

          154.hb,
        ],
      ),
    );
  }
}
