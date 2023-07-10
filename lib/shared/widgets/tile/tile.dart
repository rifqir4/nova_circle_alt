import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';

class Tile extends StatelessWidget {
  const Tile({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: child,
    );
  }
}
