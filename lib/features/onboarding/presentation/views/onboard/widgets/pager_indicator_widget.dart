import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagerIndicatorWidget extends StatelessWidget {
  const PagerIndicatorWidget({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 1; i <= pageCount; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(right: 8.w),
            width: i == currentPage ? 24.r : 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
      ],
    );
  }
}
