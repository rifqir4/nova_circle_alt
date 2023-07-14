import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_images.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({super.key});

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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8.w,
                        backgroundColor: AppColors.blueSky,
                      ),
                      SpaceH(value: 4.w),
                      Expanded(
                        child: Text("Mira",
                            style: AppTextStyles.body3
                                .copyWith(color: AppColors.white)),
                      ),
                      SvgPicture.asset(
                        AppSvgs.icListsOutlined,
                        width: 18.w,
                        colorFilter: const ColorFilter.mode(
                            AppColors.white, BlendMode.srcIn),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Casa lolea",
                    style: AppTextStyles.body3Bold
                        .copyWith(color: AppColors.white),
                  ),
                  SpaceV(value: 4.w),
                  Text(
                    "Thinking about staying at the Hotel Majestic...",
                    style: AppTextStyles.body4.copyWith(color: AppColors.white),
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
