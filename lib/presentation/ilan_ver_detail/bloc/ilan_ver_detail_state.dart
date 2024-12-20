part of 'ilan_ver_detail_bloc.dart';

/// Represents the state of IlanVerDetail in the application.

// ignore_for_file: must_be_immutable
class IlanVerDetailState extends Equatable {
  IlanVerDetailState({
    this.emailInputController,
    this.passwordInputController,
    this.IlanVerDetailModelObj,
  });

  final TextEditingController? emailInputController;
  final TextEditingController? passwordInputController;
  final IlanVerDetailModel? IlanVerDetailModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    passwordInputController,
    IlanVerDetailModelObj,
  ];

  IlanVerDetailState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    IlanVerDetailModel? IlanVerDetailModelObj,
  }) {
    return IlanVerDetailState(
      emailInputController:
      emailInputController ?? this.emailInputController,
      passwordInputController:
      passwordInputController ?? this.passwordInputController,
      IlanVerDetailModelObj: IlanVerDetailModelObj ?? this.IlanVerDetailModelObj,
    );
  }
}
