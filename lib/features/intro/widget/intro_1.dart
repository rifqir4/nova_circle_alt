import 'package:flutter/material.dart';

import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(text: "", style: AppTextStyles.title, children: [
            TextSpan(
              text: "Congratulations\n",
              style: AppTextStyles.titleBold,
            ),
            const TextSpan(text: "you’re in"),
          ])),
      const SpaceV(),
      Text("Go on, start collecting your memories.",
          textAlign: TextAlign.center, style: AppTextStyles.body2)
    ]);
  }
}
