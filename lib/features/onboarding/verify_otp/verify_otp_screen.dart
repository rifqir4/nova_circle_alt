import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_circle_alt/features/onboarding/verify_otp/widget/otp_success.dart';

import '../../../shared/widgets/loading.dart';
import './widget/otp_form.dart';
import 'verify_otp_cubit.dart';
import 'verify_otp_state.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
          builder: (context, state) {
            if (state.isLoadingVerifyOtp) {
              return const Loading();
            }

            if (state.isSuccessVerifyOtp) {
              return const OtpSuccess();
            }

            return const OtpForm();
          },
        ),
      ),
    );
  }
}
