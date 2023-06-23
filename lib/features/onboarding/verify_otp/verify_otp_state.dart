class VerifyOtpState {
  VerifyOtpState({
    this.isLoadingVerifyOtp = false,
    this.isSuccessVerifyOtp = false,
  });

  final bool isLoadingVerifyOtp;
  final bool isSuccessVerifyOtp;

  VerifyOtpState copyWith(
          {bool? isLoadingVerifyOtp, bool? isSuccessVerifyOtp}) =>
      VerifyOtpState(
        isLoadingVerifyOtp: isLoadingVerifyOtp ?? this.isLoadingVerifyOtp,
        isSuccessVerifyOtp: isSuccessVerifyOtp ?? this.isSuccessVerifyOtp,
      );
}
