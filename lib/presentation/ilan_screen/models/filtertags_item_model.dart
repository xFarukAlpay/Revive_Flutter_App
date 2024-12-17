import 'package:equatable/equatable.dart';

/// Bu sınıf [filtertags_item_widget] ekranında kullanılır.
// ignore_for_file: must_be_immutable

class FiltertagsItemModel extends Equatable {
  FiltertagsItemModel({this.tagFour, this.isSelected}) {
    tagFour = tagFour ?? "Filtrele";
    isSelected = isSelected ?? false;
  }

  String? tagFour;
  bool? isSelected;

  FiltertagsItemModel copyWith({
    String? tagFour,
    bool? isSelected,
  }) {
    return FiltertagsItemModel(
      tagFour: tagFour ?? this.tagFour,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [tagFour, isSelected];
}
