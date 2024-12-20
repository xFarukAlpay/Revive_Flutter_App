import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/ilan_ver_detail_model.dart';

part 'ilan_ver_detail_event.dart';
part 'ilan_ver_detail_state.dart';

/// A bloc that manages the state of IlanVerDetail according to the event that is dispatched to it.
class IlanVerDetailBloc extends Bloc<IlanVerDetailEvent, IlanVerDetailState> {
  IlanVerDetailBloc(IlanVerDetailState initialState) : super(initialState) {
    on<IlanverDetailInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      IlanverDetailInitialEvent event,
      Emitter<IlanVerDetailState> emit,
      ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
