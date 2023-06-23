import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit() : super(VerifyPhoneState());

  final phoneController = TextEditingController();

  void checkFormValidation() {
    bool isValid = false;
    isValid = phoneController.text.isNotEmpty;
    emit(state.copyWith(isButtonEnable: isValid));
  }
}
