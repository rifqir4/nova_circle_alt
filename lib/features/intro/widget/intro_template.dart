import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/app_colors.dart';
import '../../../shared/resources/app_svgs.dart';

class IntroTemplate extends StatelessWidget {
  const IntroTemplate({
    super.key,
    required this.pageIndex,
    required this.imageUrl,
    required this.content,
  });

  final int pageIndex;
  final String imageUrl;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardHorizontalPadding = 24.w;

    return Stack(
      children: [
        const SizedBox.expand(),
        //IMAGE
        Positioned(
            child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover),
                ))),

        //CARD
        Positioned(
            bottom: 0,
            child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.45,
                padding: EdgeInsets.only(
                  left: cardHorizontalPadding,
                  right: cardHorizontalPadding,
                  top: 42.w + 20.w,
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w))),
                child: content)),

        //NOVA LOGO
        Positioned(
            top: (screenSize.height * 0.55) - 42.w,
            left: (screenSize.width / 2) - (8.w + 44.w / 2),
            child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(1000)),
                child: SvgPicture.asset(AppSvgs.novaN, width: 44.w))),
      ],
    );
  }
}
