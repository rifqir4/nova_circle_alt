import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';
import '../verify_otp_cubit.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<VerifyOtpCubit>();

    return UnfocusWrap(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceV(value: 20.h),
            Text("We need to verify your phone number",
                style: AppTextStyles.body1Bold.copyWith(
                  color: AppColors.greyDarkest,
                )),
            SpaceV(value: 12.h),
            Text(
                "Please enter the code we sent by SMS to a phone number connected to your Apple account.",
                style: AppTextStyles.body2),
            const Spacer(),
            Center(
              child: Pinput(
                length: 4,
                separator: SpaceH(value: 16.w),
                defaultPinTheme: PinTheme(
                    textStyle: AppTextStyles.titleBold,
                    width: 72.w,
                    height: 72.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.w))),
                autofillHints: const <String>[AutofillHints.oneTimeCode],
                controller: provider.otpController,
              ),
            ),
            SpaceV(value: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                    text: "Haven’t received the code?",
                    style: AppTextStyles.body2,
                    children: [
                      TextSpan(
                        text: "  Resend",
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.sunset,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Do Something
                          },
                      )
                    ]),
              ),
            ),
            const Spacer(flex: 2),
            Button(
                title: "Continue",
                onPressed: () {
                  provider.sendOtpRequest();
                }),
            SpaceV(value: 30.h),
          ],
        ),
      ),
    );
  }
}
