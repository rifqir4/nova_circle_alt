import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';

class IntroIndicator extends StatelessWidget {
  const IntroIndicator({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(left: 16.w, right: 8.w),
      child: Row(
        children: List.generate(
            3,
            (index) => Expanded(
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 2.h,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                        color: pageIndex == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.36),
                        borderRadius: BorderRadius.circular(100))))),
      ),
    );
  }
}
