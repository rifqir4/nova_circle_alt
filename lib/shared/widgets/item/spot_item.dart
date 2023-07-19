import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/themes.dart';
import '../../resources/app_images.dart';
import '../../resources/app_svgs.dart';
import '../widgets.dart';

class SpotItem extends StatelessWidget {
  const SpotItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.sp),
      child: Stack(
        children: [
          //Image
          Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                  image: AssetImage(AppImages.intro1), fit: BoxFit.cover),
            ),
          ),

          //Overlay
          Positioned.fill(
              child: Container(
            color: AppColors.black.withOpacity(0.4),
          )),

          //Content

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      AppSvgs.icFlag,
                      width: 18.w,
                      colorFilter: const ColorFilter.mode(
                          AppColors.white, BlendMode.srcIn),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Hotel advice",
                    style: AppTextStyles.body3Bold
                        .copyWith(color: AppColors.white),
                  ),
                  SpaceV(value: 4.w),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                        size: 12,
                      ),
                      SpaceH(value: 2.w),
                      Expanded(
                        child: Text(
                          "Palma de Mallorca",
                          style: AppTextStyles.body4
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
