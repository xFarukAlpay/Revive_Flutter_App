import 'package:flutter/material.dart'; // Boşluk hatası giderildi
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/function_item_model.dart';
import '../models/listplaytwo_one_item_model.dart';
import '../models/profil_initial_model.dart';
import '../models/profil_model.dart';
part 'profil_event.dart';
part 'profil_state.dart';

/// A bloc that manages the state of a Profil according to the event that is dispatched to it.
class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  ProfilBloc(ProfilState initialState) : super(initialState) {
    on<ProfilInitialEvent>(_onInitialize);
  }

  List<FunctionItemModel> fillFunctionItemList() {
    return [
      FunctionItemModel(
        sonSRLer: ImageConstant.imgPlay2,
        recentlyplayed: "Son Sürüşler",
      ),
      FunctionItemModel(
        sonSRLer: ImageConstant.imgDownload,
        recentlyplayed: "Yorumlar",
      ),
      FunctionItemModel(
        sonSRLer: ImageConstant.imgChat,
        recentlyplayed: "Geri Dönüşler",
      ),
      FunctionItemModel(
        sonSRLer: ImageConstant.imgPurchased,
        recentlyplayed: "Hakkında",
      ),
    ];
  }

  List<ListplaytwoOneItemModel> filllistplaytwoOneItemList() {
    return [
      ListplaytwoOneItemModel(myfavorite: "Isparta / Bozüyük"),
      ListplaytwoOneItemModel(myfavorite: "Adana / Niksar"),
      ListplaytwoOneItemModel(myfavorite: "Niksar / Yozgat"),
    ];
  }

  Future<void> _onInitialize(
      ProfilInitialEvent event,
      Emitter<ProfilState> emit,
      ) async {
    emit(
      state.copyWith(
        searchController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        profilInitialModelObj: state.profilInitialModelObj?.copyWith(
          functionItemList: fillFunctionItemList(),
          listplaytwoOneItemList: filllistplaytwoOneItemList(),
        ),
      ),
    );
  }
}