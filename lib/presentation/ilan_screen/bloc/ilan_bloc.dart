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
        barefootbeach: "Kapalı Kasa / Nakliye",
        sandytoesand: "İstanbul - Ankara arasında yük taşıma",
        wilmoth: "İstanbul Lojistik",
        tag: "Lv.5",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "Açık Kasa / Canlı yük",
        sandytoesand: "Bursa - İzmir Arası canlı hayvan taşıma",
        wilmoth: "İzmir Lojistik",
        tag: "Lv.7",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "Soğutmalı Araç / Gıda Taşıma",
        sandytoesand: "Adana - Antalya arasında soğuk gıda nakliyesi",
        wilmoth: "Adana Lojistik",
        tag: "Lv.8",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "Açık Kasa / Ağır Yük",
        sandytoesand: "İzmir - Bodrum arası ağır yük taşımacılığı",
        wilmoth: "Bodrum Lojistik",
        tag: "Lv.6",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "Kapalı Kasa / Teknoloji Ürünleri",
        sandytoesand: "İstanbul - Bursa arası elektronik taşımacılığı",
        wilmoth: "Bursa Lojistik",
        tag: "Lv.10",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "Soğutmalı Araç / İlaç Taşıma",
        sandytoesand: "Ankara - Eskişehir arası ilaç dağıtımı",
        wilmoth: "Ankara Lojistik",
        tag: "Lv.4",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload1,
        barefootbeach: "Açık Kasa / İnşaat Malzemesi",
        sandytoesand: "Kayseri - Konya arası inşaat malzemesi nakliyesi",
        wilmoth: "Kayseri Lojistik",
        tag: "Lv.3",
      ),
      ListingsItemModel(
        image: ImageConstant.imgDownload2,
        barefootbeach: "Kapalı Kasa / Otomotiv Parçaları",
        sandytoesand: "Antalya - Mersin arası otomotiv yedek parça taşımacılığı",
        wilmoth: "Mersin Lojistik",
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
