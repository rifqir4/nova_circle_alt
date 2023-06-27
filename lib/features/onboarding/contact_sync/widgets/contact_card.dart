import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
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
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: 60.w,
      height: 22.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.greyLightest,
            foregroundColor: AppColors.greyDarker,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
                side: BorderSide.none)),
        onPressed: () {},
        child: Text("Follow",
            style: AppTextStyles.primary
                .copyWith(fontSize: 10.sp, color: AppColors.greyDarker)),
      ),
    );
  }
}
