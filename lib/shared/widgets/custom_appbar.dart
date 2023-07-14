import 'package:flutter/material.dart';

import '../../core/themes/themes.dart';

class CustomAppBar extends AppBar {
  final Widget? titleWidget;
  final String? titleText;

  CustomAppBar({
    this.titleWidget,
    this.titleText,
    super.key,
    super.leading,
    super.foregroundColor,
    super.actions,
  }) : super(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: titleWidget ??
              Text(
                titleText ?? "",
                style: AppTextStyles.body1Bold
                    .copyWith(color: AppColors.greyDarkest),
              ),
        );
}
