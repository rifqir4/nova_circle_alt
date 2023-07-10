import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/features/onboarding/contact_sync/widgets/button_follow.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Tile(
      child: Row(
        children: [
          //Picture
          Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                  color: AppColors.blueSky,
                  borderRadius: BorderRadius.circular(8.w))),
          SpaceH(value: 10.w),

          //Info
          Expanded(
              child: SizedBox(
                  height: 36.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("David Kopmen",
                          style: AppTextStyles.body2
                              .copyWith(color: AppColors.greyDarkest)),
                      Text("@adada", style: AppTextStyles.body3),
                    ],
                  ))),

          //Button
          const ButtonFollow(isFollow: true),
        ],
      ),
    );
  }
}
