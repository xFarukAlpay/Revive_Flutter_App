import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/ilan_ver_picture_model.dart';

part 'ilan_ver_picture_event.dart';
part 'ilan_ver_picture_state.dart';

/// A bloc that manages the state of IlanVerPicture according to the event that is dispatched to it.
class IlanVerPictureBloc extends Bloc<IlanVerPictureEvent, IlanVerPictureState> {
  IlanVerPictureBloc(IlanVerPictureState initialState) : super(initialState) {
    on<IlanverPictureInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      IlanverPictureInitialEvent event,
      Emitter<IlanVerPictureState> emit,
      ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
