import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  late TextEditingController controller;

  bool isCloseVisible = false;

  @override
  void initState() {
    super.initState();

    controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            spreadRadius: 0,
            blurRadius: 12,
            color: AppColors.grey.withOpacity(0.25))
      ], borderRadius: BorderRadius.circular(1000)),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.greyDarker,
        style: AppTextStyles.body2,
        onChanged: (_) =>
            setState(() => isCloseVisible = controller.text.isNotEmpty),
        decoration: InputDecoration(
          hintText: "Search cities, users, spots, lists,...",
          hintStyle: AppTextStyles.body2.copyWith(color: AppColors.grey),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 14.w),
          filled: true,
          fillColor: AppColors.white,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: SvgPicture.asset(AppSvgs.icSearch),
            ),
          ),
          suffixIcon: isCloseVisible
              ? GestureDetector(
                  onTap: () => setState(() {
                    controller.clear();
                    isCloseVisible = false;
                  }),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: SvgPicture.asset(AppSvgs.icClose),
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: BorderSide(color: AppColors.blueSky, width: 1.sp)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
