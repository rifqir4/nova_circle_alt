import 'package:flutter/material.dart';

import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "The world from\na ",
              style: AppTextStyles.title,
              children: [
                TextSpan(
                    text: "friendly place", style: AppTextStyles.titleBold),
              ])),
      const SpaceV(),
      Text(
          "When trying to figure out where to go, why not get a sense of how you want to experience it from the people you trust the most. With Nova circle, you get a curated selection of recommendations from your circle of people which can include friends and creators from all around the world.",
          textAlign: TextAlign.center,
          style: AppTextStyles.body2)
    ]);
  }
}
