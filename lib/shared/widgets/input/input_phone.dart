import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';
import '../botsheet/botsheet_country_code.dart';
import '../widgets.dart';

class InputPhone extends StatelessWidget {
  const InputPhone({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorColor: AppColors.greyDarker,
        onChanged: onChanged,
        style: AppTextStyles.body2,
        decoration: InputDecoration(
          isDense: true,
          hintText: "Phone Number",
          hintStyle: AppTextStyles.body2.copyWith(
            color: AppColors.greyLighter,
          ),
          prefixIcon: const _CountryCode(),
          contentPadding: EdgeInsets.all(12.w),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class _CountryCode extends StatelessWidget {
  const _CountryCode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const BotSheetCountryCode());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpaceH(value: 12.w),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.blueSky,
                borderRadius: BorderRadius.circular(4.w)),
            width: 26.w,
            height: 20.w,
            child: const Flag.fromString("SE", fit: BoxFit.cover),
          ),
          SpaceH(value: 12.w),
          Text("+46", style: AppTextStyles.body2.copyWith(height: 1)),
          SpaceH(value: 2.w),
        ],
      ),
    );
  }
}
