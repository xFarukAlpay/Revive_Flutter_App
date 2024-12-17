import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'filtertags_item_model.dart';
import 'listings_item_model.dart';

/// This class defines the variables used in the [ilan_screen],
/// and is typically used to hold data that is passed between different parts of
// ignore_for_file: must_be_immutable

class IlanModel extends Equatable {
  IlanModel({
    this.filtertagsItemList = const [], this.listingsItemList = const [],});

  List<FiltertagsItemModel> filtertagsItemList;
  List<ListingsItemModel> listingsItemList;

  IlanModel copyWith({
    List<FiltertagsItemModel>? filtertagsItemList,
    List<ListingsItemModel>? listingsItemList,
  }) {
    return IlanModel(
      filtertagsItemList: filtertagsItemList ?? this.filtertagsItemList,
      listingsItemList: listingsItemList ?? this.listingsItemList,
    );
  }

  @override
  List<Object> get props => [filtertagsItemList, listingsItemList];
}
