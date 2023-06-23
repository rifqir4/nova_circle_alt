import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/features/intro/widget/intro_indicator.dart';

import './widget/intro_1.dart';
import './widget/intro_2.dart';
import './widget/intro_3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int pageIndex = 0;
  String image = "";
  Widget content = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            PageView(
              onPageChanged: (page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: const [Intro1(), Intro2(), Intro3()],
            ),

            //INDICATOR
            Positioned(
                top: kToolbarHeight + 20.h,
                child: IntroIndicator(pageIndex: pageIndex)),
          ],
        ));
  }
}
