import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/ilan_ver_shared_model.dart';

part 'ilan_ver_shared_event.dart';
part 'ilan_ver_shared_state.dart';

/// A bloc that manages the state of IlanVerShared according to the event that is dispatched to it.
class IlanVerSharedBloc extends Bloc<IlanVerSharedEvent, IlanVerSharedState> {
  IlanVerSharedBloc(IlanVerSharedState initialState) : super(initialState) {
    on<IlanverSharedInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      IlanverSharedInitialEvent event,
      Emitter<IlanVerSharedState> emit,
      ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
