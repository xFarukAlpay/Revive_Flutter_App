import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/login_ekran_model.dart';
part 'login_ekran_event.dart';
part 'login_ekran_state.dart';

/// A bloc that manages the state of a LoginEkran according to the event that is dispatched to it.
class LoginEkranBloc extends Bloc<LoginEkranEvent, LoginEkranState> {
  LoginEkranBloc(LoginEkranState initialState) : super(initialState) {
    on<LoginEkranInitialEvent>(_onInitialize);
    on<LoginEkranButtonPressed>(_buildLoginButton);

  }
  void _buildLoginButton(
      LoginEkranButtonPressed event,
      Emitter<LoginEkranState> emit,
      ) {
    NavigatorService.popAndPushNamed(
      AppRoutes.ilanScreen,
    );
  }

  _onInitialize(
      LoginEkranInitialEvent event,
      Emitter<LoginEkranState> emit,
      ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
