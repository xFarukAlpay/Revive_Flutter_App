// Bloc yapılandırması ve eventlerin ele alınışı
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/giri_ekran_model.dart';

part 'giri_ekran_event.dart';
part 'giri_ekran_state.dart';

class GiriEkranBloc extends Bloc<GiriEkranEvent, GiriEkranState> {
  GiriEkranBloc(GiriEkranState initialState) : super(initialState) {
    on<GiriEkranInitialEvent>(_onInitialize);
    on<GiriEkranLoginButtonPressed>(_onLoginButtonPressed);
    on<GiriEkranSignupButtonPressed>(_onSignupButtonPressed);

  }

  void _onInitialize(
      GiriEkranInitialEvent event,
      Emitter<GiriEkranState> emit,
      ) {
    // Giriş ekranı başlatıldığında yapılacak işlemler
  }

  void _onLoginButtonPressed(
      GiriEkranLoginButtonPressed event,
      Emitter<GiriEkranState> emit,
      ) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginEkranScreen,
    );
  }


  void _onSignupButtonPressed(
      GiriEkranSignupButtonPressed event,
      Emitter<GiriEkranState> emit,
      ) {
    NavigatorService.popAndPushNamed(
      AppRoutes.ilanScreen,
    );
  }
}
