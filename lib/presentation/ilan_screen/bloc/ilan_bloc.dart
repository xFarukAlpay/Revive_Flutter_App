import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/filtertags_item_model.dart';
import '../models/ilan_model.dart';
import '../models/listings_item_model.dart';
part 'ilan_event.dart';
part 'ilan_state.dart';

/// A bloc that manages the state of a Ilan according to the event that is dispatched to it.
class IlanBloc extends Bloc<IlanEvent, IlanState> {
  IlanBloc(IlanState initialState) : super(initialState) {
    on<IlanInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);

  }

  _updateChipView(
      UpdateChipViewEvent event,
      Emitter<IlanState> emit,
      ) {
    List<FiltertagsItemModel> newList =
    List<FiltertagsItemModel>.from(state.ilanModelObj!.filtertagsItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(
      state.copyWith(
        ilanModelObj: state.ilanModelObj?.copyWith(
          filtertagsItemList: newList,
        ),
      ),
    );
  }

  List<FiltertagsItemModel> fillFiltertagsItemList() {
    return List.generate(8, (index) => FiltertagsItemModel());
  }

  List<ListingsItemModel> fillListingsItemList() {
    return [
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "2. El Kitaplar",
        sandytoesand: "İstanbul - Ankara arasında kitap ",
        wilmoth: "Kitap Lojistik",
        tag: "Lv.5",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "2. El Mobilya",
        sandytoesand: "Bursa - İzmir arası mobilya ",
        wilmoth: "Mobilya Lojistik",
        tag: "Lv.7",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "2. El Elektronik",
        sandytoesand: "Adana - Antalya arasında elektronik ürün ",
        wilmoth: "Elektronik Lojistik",
        tag: "Lv.8",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "2. El Beyaz Eşya",
        sandytoesand: "İzmir - Bodrum arası beyaz eşya ",
        wilmoth: "Beyaz Eşya Lojistik",
        tag: "Lv.6",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "2. El Araç Parçaları",
        sandytoesand: "İstanbul - Bursa arası araç parçaları ",
        wilmoth: "Araç Parça Lojistik",
        tag: "Lv.10",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "2. El Giyim",
        sandytoesand: "Ankara - Eskişehir arası giyim ürünleri ",
        wilmoth: "Giyim Lojistik",
        tag: "Lv.4",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "2. El Oyuncak",
        sandytoesand: "Kayseri - Konya arası oyuncak ",
        wilmoth: "Oyuncak Lojistik",
        tag: "Lv.3",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "2. El Antika",
        sandytoesand: "Antalya - Mersin arası antika ",
        wilmoth: "Antika Lojistik",
        tag: "Lv.2",
      ),
    ];
  }

  _onInitialize(
      IlanInitialEvent event,
      Emitter<IlanState> emit,
      ) async {
    emit(
      state.copyWith(
        searchController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        ilanModelObj: state.ilanModelObj?.copyWith(
          filtertagsItemList: fillFiltertagsItemList(),
          listingsItemList: fillListingsItemList(),
        ),
      ),
    );
  }
}
