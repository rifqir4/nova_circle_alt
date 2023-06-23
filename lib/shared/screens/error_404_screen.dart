import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/themes.dart';
import '../resources/app_svgs.dart';
import '../widgets/widgets.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(AppSvgs.illustration404,
              width: AppDimension.illustrationWidth),
          SpaceV(value: 16.h),
          Text("Oops!", style: AppTextStyles.body2Bold),
          SpaceV(value: 16.h),
          Text("Something went wrong!", style: AppTextStyles.body2),
        ]),
      ),
    );
  }
}
