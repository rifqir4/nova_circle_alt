import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/features/intro/widget/intro_indicator.dart';
import 'package:nova_circle_alt/shared/resources/app_images.dart';

import '../../core/themes/themes.dart';
import '../../shared/resources/app_svgs.dart';
import './widget/intro_1.dart';
import './widget/intro_2.dart';
import './widget/intro_3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final listImages = [AppImages.intro1, AppImages.intro2, AppImages.intro3];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardHorizontalPadding = 24.w;

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const SizedBox.expand(),

            //IMAGE
            Positioned(
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    reverseDuration: const Duration(milliseconds: 500),
                    child: Container(
                        key: ValueKey("image-$pageIndex"),
                        width: screenSize.width,
                        height: screenSize.height * 0.65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(listImages[pageIndex]),
                              fit: BoxFit.cover),
                        )))),

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
                    child: PageView(
                      onPageChanged: (page) {
                        setState(() {
                          pageIndex = page;
                        });
                      },
                      children: const [Intro1(), Intro2(), Intro3()],
                    ))),

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

            //INDICATOR
            Positioned(
                top: kToolbarHeight + 20.h,
                child: IntroIndicator(pageIndex: pageIndex)),
          ],
        ));
  }
}
