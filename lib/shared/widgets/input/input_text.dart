import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, this.hintText, this.controller});

  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        cursorColor: AppColors.greyDarkest,
        style: AppTextStyles.body3.copyWith(
          color: AppColors.greyDarkest,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(14.w),
          hintText: hintText,
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
      ),
    );
  }
}
