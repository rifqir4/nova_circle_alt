class VerifyPhoneState {
  VerifyPhoneState({
    this.isButtonEnable = false,
  });

  final bool isButtonEnable;

  VerifyPhoneState copyWith({bool? isButtonEnable}) => VerifyPhoneState(
        isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      );
}
