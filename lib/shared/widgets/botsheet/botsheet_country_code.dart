import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';
import '../../model/country_code.dart';
import '../../resources/country_codes.dart';
import '../loading.dart';
import 'botsheet_template.dart';

class BotSheetCountryCode extends StatefulWidget {
  const BotSheetCountryCode({super.key, required this.initialValue});

  final CountryCode initialValue;

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
    final findIndex = listCountryCode
        .indexWhere((e) => e.dialCode == widget.initialValue.dialCode);
    final double initScrollOffset =
        findIndex > 2 ? (findIndex - 2) * tileHeight : 0;
    controller = ScrollController(initialScrollOffset: initScrollOffset);
  }

  @override
  Widget build(BuildContext context) {
    return BotsheetTemplate(
      child: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 500)),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Loading();
          }

          return ListView.builder(
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
                  child: Row(
                    children: [
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
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
