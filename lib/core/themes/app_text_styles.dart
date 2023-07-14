import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const inter = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: AppColors.greyDarker,
  );

  static final interItalic = inter.copyWith(
    fontStyle: FontStyle.italic,
  );

  static final interBold = inter.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final interBoldItalic = interBold.copyWith(
    fontStyle: FontStyle.italic,
  );

  static const areaInktrap = TextStyle(
    fontFamily: "AreaInktrap",
    fontWeight: FontWeight.w400,
  );

  static final areaInktrapSemibold = areaInktrap.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final areaInktrapBold = areaInktrap.copyWith(
    fontWeight: FontWeight.w800,
  );

  static final title = areaInktrap.copyWith(
    fontSize: 24.sp,
    height: 1.1,
    color: AppColors.textTitle,
  );

  static final titleBold = areaInktrapBold.copyWith(
    fontSize: 24.sp,
    height: 1.1,
    color: AppColors.textTitle,
  );

  static final subtitle = areaInktrap.copyWith(
    fontSize: 18.sp,
    color: AppColors.textTitle,
  );

  static final subtitleBold = subtitle.copyWith(
    fontWeight: FontWeight.w700,
  );

  //Inter

  static final body1 = inter.copyWith(
    fontSize: 16.sp,
  );

  static final body1Bold = interBold.copyWith(
    fontSize: 16.sp,
  );

  static final body2 = inter.copyWith(
    fontSize: 14.sp,
    height: 1.2,
  );

  static final body2Bold = interBold.copyWith(
    fontSize: 14.sp,
    height: 1.2,
  );

  static final body3 = inter.copyWith(
    fontSize: 12.sp,
    height: 1.2,
  );

  static final body3Bold = interBold.copyWith(
    fontSize: 12.sp,
    height: 1.2,
  );

  static final body4 = inter.copyWith(
    fontSize: 10.sp,
  );

  static final body4Bold = interBold.copyWith(
    fontSize: 10.sp,
  );
}
