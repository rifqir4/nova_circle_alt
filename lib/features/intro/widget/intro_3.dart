import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/shared/resources/app_images.dart';

import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';
import './intro_template.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroTemplate(
      pageIndex: 2,
      imageUrl: AppImages.intro3,
      content: Column(children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Find, save and share\nyour ",
                style: AppTextStyles.title,
                children: [
                  TextSpan(text: "hidden", style: AppTextStyles.titleBold),
                  const TextSpan(text: " gems")
                ])),
        const SpaceV(),
        Text(
            "Catalog and recommend places, activities, restaurants, or other favorite experiences. By growing a circle of followers who trust your taste and style, you will be able to access features that give you more to collect than just memories.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body2),
        const SpaceV(),
        ButtonText(
            title: "Start",
            textStyle: AppTextStyles.body2Bold.copyWith(
              color: AppColors.blueSky,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.auth, (route) => false);
            }),
      ]),
    );
  }
}
