import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import './app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final primary = GoogleFonts.inter().copyWith(
    color: AppColors.text,
  );

  static final title = primary.copyWith(
    fontSize: 24.sp,
    height: 1.1,
    color: AppColors.textTitle,
  );

  static final titleBold = title.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final body1 = primary.copyWith(
    fontSize: 16.sp,
  );

  static final body1Medium = body1.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final body1Semibold = body1.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final body1Bold = body1.copyWith(
    fontWeight: FontWeight.w900,
  );

  static final body2 = primary.copyWith(
    fontSize: 14.sp,
    height: 1.2,
  );
  static final body2Bold = body2.copyWith(
    fontWeight: FontWeight.w900,
  );
}
