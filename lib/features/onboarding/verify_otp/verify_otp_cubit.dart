import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nova_circle_alt/features/onboarding/verify_otp/verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpState());

  final otpController = TextEditingController();

  Future<void> sendOtpRequest() async {
    emit(state.copyWith(isLoadingVerifyOtp: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoadingVerifyOtp: false, isSuccessVerifyOtp: true));
  }
}
