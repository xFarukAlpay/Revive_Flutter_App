import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [function_item_widget] screen.

// ignore_for_file: must_be_immutable

class FunctionItemModel extends Equatable {
  FunctionItemModel({
    this.sonSRLer,
    this.recentlyplayed,
    this.id,
  }) {
    sonSRLer = sonSRLer ?? ImageConstant.imgPlay2;
    recentlyplayed = recentlyplayed ?? "Son Sürüşler";
    id = id ?? "";
  }

  String? sonSRLer;
  String? recentlyplayed;
  String? id;

  FunctionItemModel copyWith({
    String? sonSRLer,
    String? recentlyplayed,
    String? id,
  }) {
    return FunctionItemModel(
      sonSRLer: sonSRLer ?? this.sonSRLer,
      recentlyplayed: recentlyplayed ?? this.recentlyplayed,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [sonSRLer, recentlyplayed, id];
}
