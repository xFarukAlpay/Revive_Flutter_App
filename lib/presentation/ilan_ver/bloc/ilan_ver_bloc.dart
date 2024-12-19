import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/ilan_ver_model.dart';

part 'ilan_ver_event.dart';
part 'ilan_ver_state.dart';

/// A bloc that manages the state of IlanVer according to the event that is dispatched to it.
class IlanVerBloc extends Bloc<IlanVerEvent, IlanVerState> {
  IlanVerBloc(IlanVerState initialState) : super(initialState) {
    on<IlanverInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      IlanverInitialEvent event,
      Emitter<IlanVerState> emit,
      ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
