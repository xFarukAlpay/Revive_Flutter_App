part of 'login_ekran_bloc.dart';

/// Represents the state of LoginEkran in the application.

// ignore_for_file: must_be_immutable
class LoginEkranState extends Equatable {
  LoginEkranState({
    this.emailInputController,
    this.passwordInputController,
    this.loginEkranModelObj,
  });

  TextEditingController? emailInputController;
  TextEditingController? passwordInputController;
  LoginEkranModel? loginEkranModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    passwordInputController,
    loginEkranModelObj,
  ];

  LoginEkranState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    LoginEkranModel? loginEkranModelObj,
  }) {
    return LoginEkranState(
      emailInputController:
      emailInputController ?? this.emailInputController,
      passwordInputController:
      passwordInputController ?? this.passwordInputController,
      loginEkranModelObj:
      loginEkranModelObj ?? this.loginEkranModelObj,
    );
  }
}
