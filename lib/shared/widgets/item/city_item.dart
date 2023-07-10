import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';
import '../widgets.dart';

class CityItem extends StatelessWidget {
  const CityItem({super.key, this.isSelected = false});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 56 / 96,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: AppColors.blueSky),
              ),
            ),
            if (isSelected)
              Positioned.fill(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: AppColors.sunset.withOpacity(0.9)),
                child: Icon(Icons.check, size: 32.sp, color: AppColors.white),
              ))
          ],
        ),
        SpaceV(value: 6.w),
        Text(
          "Palma de Mallorca",
          textAlign: TextAlign.center,
          style: AppTextStyles.body3,
        )
      ],
    );
  }
}
