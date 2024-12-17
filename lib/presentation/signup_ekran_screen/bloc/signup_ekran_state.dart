part of 'signup_ekran_bloc.dart';

/// Represents the state of SignupEkran in the application.
// ignore_for_file: must_be_immutable

class SignupEkranState extends Equatable {
  SignupEkranState({
    this.emailInputController,
    this.phoneInputController,
    this.usernameInputController,
    this.passwordInputController,
    this.confirmPasswordInputController,
    this.signupEkranModelObj,
  });

  TextEditingController? emailInputController;
  TextEditingController? phoneInputController;
  TextEditingController? usernameInputController;
  TextEditingController? passwordInputController;
  TextEditingController? confirmPasswordInputController;
  SignupEkranModel? signupEkranModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    phoneInputController,
    usernameInputController,
    passwordInputController,
    confirmPasswordInputController,
    signupEkranModelObj,
  ];

  SignupEkranState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? phoneInputController,
    TextEditingController? usernameInputController,
    TextEditingController? passwordInputController,
    TextEditingController? confirmPasswordInputController,
    SignupEkranModel? signupEkranModelObj,
  }) {
    return SignupEkranState(
      emailInputController: emailInputController ?? this.emailInputController,
      phoneInputController: phoneInputController ?? this.phoneInputController,
      usernameInputController: usernameInputController ?? this.usernameInputController,
      passwordInputController: passwordInputController ?? this.passwordInputController,
      confirmPasswordInputController: confirmPasswordInputController ?? this.confirmPasswordInputController,
      signupEkranModelObj: signupEkranModelObj ?? this.signupEkranModelObj,
    );
  }
}
