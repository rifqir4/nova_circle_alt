import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/themes.dart';
import '../../../shared/resources/app_svgs.dart';
import '../../../shared/widgets/widgets.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool termsChecked = false;
  bool emailChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const Spacer(flex: 5),
              Center(
                  child: SvgPicture.asset(AppSvgs.illustrationAgreement,
                      width: 110.w)),
              SpaceV(value: 30.h),

              //Terms Checkbox
              _CheckBox(
                  checked: termsChecked,
                  onPressed: () {
                    setState(() {
                      termsChecked = !termsChecked;
                    });
                  },
                  child: RichText(
                      text: TextSpan(
                          text:
                              "By clicking continue, I confirm that I have read and understand the",
                          style: AppTextStyles.body2
                              .copyWith(color: AppColors.greyDarker),
                          children: [
                        TextSpan(
                            text: "Terms and Conditions",
                            style: AppTextStyles.body2
                                .copyWith(color: AppColors.sunset)),
                        const TextSpan(text: " and "),
                        TextSpan(
                            text: "Privacy Policy",
                            style: AppTextStyles.body2
                                .copyWith(color: AppColors.sunset)),
                        const TextSpan(
                            text:
                                ", including the use of cookies and storing of my personal information.")
                      ]))),
              const SpaceV(),

              //Email Checkbox
              _CheckBox(
                  checked: emailChecked,
                  onPressed: () {
                    setState(() {
                      emailChecked = !emailChecked;
                    });
                  },
                  child: Text(
                    "Yes, I agree to receive emails from Nova Circle.",
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.greyDarker,
                    ),
                  )),
              const Spacer(flex: 3),
              Button(title: "Continue", onPressed: () {}),
              SpaceV(value: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox(
      {required this.checked, required this.child, required this.onPressed});

  final bool checked;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: onPressed,
            child: Container(
                width: 24.w,
                height: 24.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6.w),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyLighter,
                    )),
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: checked ? 1.0 : 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.sunset,
                      ),
                    )))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  top: 4.w,
                ),
                child: child)),
      ],
    );
  }
}
