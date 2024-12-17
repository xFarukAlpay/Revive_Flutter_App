import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/signup_ekran_model.dart';

part 'signup_ekran_event.dart';
part 'signup_ekran_state.dart';

/// A bloc that manages the state of a SignupEkran according to the event that is dispatched to it.
class SignupEkranBloc extends Bloc<SignupEkranEvent, SignupEkranState> {
  SignupEkranBloc(SignupEkranState initialState) : super(initialState) {
    on<SignupEkranInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      SignupEkranInitialEvent event,
      Emitter<SignupEkranState> emit,
      ) async {
    emit(state.copyWith(
      emailInputController: TextEditingController(),
      phoneInputController: TextEditingController(),
      usernameInputController: TextEditingController(),
      passwordInputController: TextEditingController(),
      confirmPasswordInputController: TextEditingController(),
    ));
  }
}
