import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';
import '../../model/country_code.dart';
import '../botsheet/botsheet_country_code.dart';
import '../widgets.dart';

class InputPhone extends StatefulWidget {
  const InputPhone({super.key, this.onChanged});
  final Function(String)? onChanged;

  @override
  State<InputPhone> createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  final controller = TextEditingController();

  late CountryCode selected;

  @override
  void initState() {
    super.initState();

    selected =
        CountryCode(code: "SE", name: "Swedia", flag: "", dialCode: "+46");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          _ButtonCountryCode(
            value: selected,
            onChange: (code) {
              setState(() {
                selected = code;
              });

              widget.onChanged?.call("${selected.dialCode}${controller.text}");
            },
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              cursorColor: AppColors.greyDarker,
              onChanged: (text) {
                widget.onChanged?.call("${selected.dialCode}$text");
              },
              style: AppTextStyles.body2,
              decoration: InputDecoration(
                isDense: true,
                hintText: "Phone Number",
                hintStyle:
                    AppTextStyles.body2.copyWith(color: AppColors.greyLighter),
                contentPadding: EdgeInsets.only(
                    top: 12.w, bottom: 12.w, right: 12.w, left: 2.w),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                errorBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonCountryCode extends StatelessWidget {
  const _ButtonCountryCode({
    required this.value,
    required this.onChange,
  });

  final CountryCode value;
  final Function(CountryCode) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final CountryCode? selected = await showModalBottomSheet(
            context: context,
            barrierColor: AppColors.modalOverlay,
            backgroundColor: Colors.transparent,
            builder: (context) => BotSheetCountryCode(initialValue: value));

        if (selected is CountryCode) {
          onChange.call(selected);
        }
      },
      child: Container(
        color: Colors.transparent,
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
              child: Flag.fromString(value.code, fit: BoxFit.cover),
            ),
            SpaceH(value: 12.w),
            Text(value.dialCode,
                style: AppTextStyles.body2.copyWith(height: 1)),
            SpaceH(value: 2.w),
          ],
        ),
      ),
    );
  }
}
