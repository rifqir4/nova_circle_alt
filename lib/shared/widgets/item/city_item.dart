import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/resources/app_images.dart';

import '../../../core/themes/themes.dart';
import '../widgets.dart';

class CityItem extends StatelessWidget {
  const CityItem({super.key, this.isSelected = false, this.onTap});

  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 56 / 96,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: const DecorationImage(
                          image: AssetImage(AppImages.intro3),
                          fit: BoxFit.cover),
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
      ),
    );
  }
}
