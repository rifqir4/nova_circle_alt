import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

import '../../../core/themes/themes.dart';

class BotsheetTemplate extends StatelessWidget {
  const BotsheetTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.w),
                topRight: Radius.circular(16.w),
              )),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 18.w),
                        width: 32.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ))),
                child,
                SpaceV(value: 30.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
