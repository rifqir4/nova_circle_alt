import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/model/country_code.dart';

import '../../../core/themes/themes.dart';
import '../../resources/country_codes.dart';

class BotSheetCountryCode extends StatefulWidget {
  const BotSheetCountryCode({super.key});

  @override
  State<BotSheetCountryCode> createState() => _BotSheetCountryCodeState();
}

class _BotSheetCountryCodeState extends State<BotSheetCountryCode> {
  final double tileHeight = 34.h;

  late ScrollController controller;
  late List<CountryCode> listCountryCode;

  @override
  void initState() {
    super.initState();

    listCountryCode = countryCodes.map((e) => CountryCode.fromJson(e)).toList();
    controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final findIndex = listCountryCode.indexWhere((e) => e.dialCode == "+46");
      controller.jumpTo(findIndex * tileHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w),
              topRight: Radius.circular(16.w),
            )),
        child: Column(
          children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 18.w),
                    width: 32.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ))),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  itemCount: listCountryCode.length,
                  itemBuilder: (context, idx) {
                    final data = listCountryCode[idx];
                    final code = data.code;
                    final dialCode = data.dialCode;
                    final name = data.name;

                    return GestureDetector(
                      onTap: () => Navigator.of(context).pop(data),
                      child: SizedBox(
                        height: tileHeight,
                        width: double.infinity,
                        child: Row(children: [
                          Container(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                              width: 32.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              child: Flag.fromString(code, fit: BoxFit.cover)),
                          Expanded(
                              child: Text("$name ($dialCode)",
                                  style: AppTextStyles.body2))
                        ]),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
