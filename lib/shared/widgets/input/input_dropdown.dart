import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

import '../../../core/themes/themes.dart';

class InputDropdownData {
  InputDropdownData({required this.name, required this.value});

  final String name;
  final String value;
}

class InputDropdown extends StatelessWidget {
  const InputDropdown({
    Key? key,
    this.value,
    this.items,
    required this.onChanged,
  }) : super(key: key);

  final String? value;
  final List<InputDropdownData>? items;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField(
        isDense: true,
        value: value,
        icon: SvgPicture.asset(
          AppSvgs.icChevDown,
          width: 14.w,
          colorFilter: const ColorFilter.mode(
            AppColors.greyDarkest,
            BlendMode.srcIn,
          ),
        ),
        dropdownColor: AppColors.white,
        elevation: 1,
        borderRadius: BorderRadius.circular(10.w),
        isExpanded: true,
        style: AppTextStyles.body3.copyWith(
          color: AppColors.greyDarkest,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(0, 10.w, 14.w, 10.w),
          hintStyle: AppTextStyles.body3.copyWith(
            color: AppColors.greyDarker,
          ),
          filled: true,
          fillColor: AppColors.greyLightest,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        items: (items ?? [])
            .map(
              (e) => DropdownMenuItem(
                value: e.value,
                child: Text(
                  e.name,
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.greyDarkest,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
