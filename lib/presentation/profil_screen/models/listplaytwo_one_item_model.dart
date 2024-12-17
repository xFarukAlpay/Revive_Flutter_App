import 'package:equatable/equatable.dart';

/// This class is used in the [listplaytwo_one_item_widget] screen.

// ignore_for_file: must_be_immutable

class ListplaytwoOneItemModel extends Equatable {
  ListplaytwoOneItemModel({
    this.myfavorite,
    this.id,
  }) {
    myfavorite = myfavorite ?? "Isparta / Bozüyük";
    id = id ?? "";
  }

  String? myfavorite;
  String? id;

  ListplaytwoOneItemModel copyWith({
    String? myfavorite,
    String? id,
  }) {
    return ListplaytwoOneItemModel(
      myfavorite: myfavorite ?? this.myfavorite,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [myfavorite, id];
}
