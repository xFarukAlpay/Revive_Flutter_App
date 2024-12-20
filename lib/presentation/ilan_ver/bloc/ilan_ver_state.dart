
part of 'ilan_ver_bloc.dart';

/// Represents the state of IlanVer in the application.

// ignore_for_file: must_be_immutable
class IlanVerState extends Equatable {
  IlanVerState({
    this.emailInputController,
    this.passwordInputController,
    this.IlanVerModelObj,
  });

  final TextEditingController? emailInputController;
  final TextEditingController? passwordInputController;
  final IlanVerModel? IlanVerModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    passwordInputController,
    IlanVerModelObj,
  ];

  IlanVerState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    IlanVerModel? IlanVerModelObj,
  }) {
    return IlanVerState(
      emailInputController:
      emailInputController ?? this.emailInputController,
      passwordInputController:
      passwordInputController ?? this.passwordInputController,
      IlanVerModelObj: IlanVerModelObj ?? this.IlanVerModelObj,
    );
  }
}
