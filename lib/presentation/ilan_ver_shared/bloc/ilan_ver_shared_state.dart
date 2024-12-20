part of 'ilan_ver_shared_bloc.dart';

/// Represents the state of IlanVerShared in the application.

// ignore_for_file: must_be_immutable
class IlanVerSharedState extends Equatable {
  IlanVerSharedState({
    this.emailInputController,
    this.passwordInputController,
    this.IlanVerSharedModelObj,
  });

  final TextEditingController? emailInputController;
  final TextEditingController? passwordInputController;
  final IlanVerSharedModel? IlanVerSharedModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    passwordInputController,
    IlanVerSharedModelObj,
  ];

  IlanVerSharedState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    IlanVerSharedModel? IlanVerSharedModelObj,
  }) {
    return IlanVerSharedState(
      emailInputController:
      emailInputController ?? this.emailInputController,
      passwordInputController:
      passwordInputController ?? this.passwordInputController,
      IlanVerSharedModelObj: IlanVerSharedModelObj ?? this.IlanVerSharedModelObj,
    );
  }
}
