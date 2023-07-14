import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

import '../../../core/themes/themes.dart';
import '../widgets.dart';

class BotsheetPublicity extends StatefulWidget {
  const BotsheetPublicity({super.key});

  @override
  State<BotsheetPublicity> createState() => _BotsheetPublicityState();
}

class _BotsheetPublicityState extends State<BotsheetPublicity> {
  final List<Map<String, String>> _list = [
    {"title": "Public", "icon": AppSvgs.icUnlock},
    {"title": "Private", "icon": AppSvgs.icLock},
    {"title": "My Circle", "icon": AppSvgs.icUsers},
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        final title = _list[index]["title"]!;
        final icon = _list[index]["icon"]!;
        final isSelected = selected == index;

        return GestureDetector(
          onTap: () => setState(() => selected = index),
          child: _buildItem(title: title, icon: icon, isSelected: isSelected),
        );
      },
    );
  }

  Widget _buildItem({
    required String title,
    required String icon,
    bool isSelected = false,
  }) {
    final textColor = isSelected ? AppColors.white : AppColors.greyDarker;
    final iconColor = isSelected ? AppColors.white : AppColors.greyDarkest;
    final bgColor = isSelected ? AppColors.blueSky : AppColors.greyLightest;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 8.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.w,
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          SpaceH(value: 12.w),
          Text(
            title,
            style: AppTextStyles.body2.copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
