import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listings_item_widget] screen.

// ignore_for_file: must_be_immutable

class ListingsItemModel extends Equatable {
  ListingsItemModel({
    this.image,
    this.barefootbeach,
    this.sandytoesand,
    this.wilmoth,
    this.tag,
    this.id,}) {
    image = image ?? ImageConstant.imgDownload2;
    barefootbeach = barefootbeach ?? "Açık Kasa /Canli yük";
    sandytoesand = sandytoesand ?? "Bursa Kocaeli Aras ingiliz kısrak At Tasma";
    wilmoth = wilmoth ?? "Bursa Lojistik";
    tag = tag ?? "Lv.9";
    id = id ?? "";
  }

  String? image;
  String? barefootbeach;
  String? sandytoesand;
  String? wilmoth;
  String? tag;
  String? id;

  ListingsItemModel copyWith({
    String? image,
    String? barefootbeach,
    String? sandytoesand,
    String? wilmoth,
    String? tag,
    String? id,
  }) {
    return ListingsItemModel(
      image: image ?? this.image,
      barefootbeach: barefootbeach ?? this.barefootbeach,
      sandytoesand: sandytoesand ?? this.sandytoesand,
      wilmoth: wilmoth ?? this.wilmoth,
      tag: tag ?? this.tag,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [image, barefootbeach, sandytoesand, wilmoth, tag, id];
}
