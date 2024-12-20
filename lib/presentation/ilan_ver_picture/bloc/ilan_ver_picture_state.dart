part of 'ilan_ver_picture_bloc.dart';

/// Represents the state of IlanVerPicture in the application.

// ignore_for_file: must_be_immutable
class IlanVerPictureState extends Equatable {
  IlanVerPictureState({
    this.emailInputController,
    this.passwordInputController,
    this.IlanVerPictureModelObj,
  });

  final TextEditingController? emailInputController;
  final TextEditingController? passwordInputController;
  final IlanVerPictureModel? IlanVerPictureModelObj;

  @override
  List<Object?> get props => [
    emailInputController,
    passwordInputController,
    IlanVerPictureModelObj,
  ];

  IlanVerPictureState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    IlanVerPictureModel? IlanVerPictureModelObj,
  }) {
    return IlanVerPictureState(
      emailInputController:
      emailInputController ?? this.emailInputController,
      passwordInputController:
      passwordInputController ?? this.passwordInputController,
      IlanVerPictureModelObj: IlanVerPictureModelObj ?? this.IlanVerPictureModelObj,
    );
  }
}
