import 'package:equatable/equatable.dart';
import 'function_item_model.dart';
import 'listplaytwo_one_item_model.dart';

/// This class is used in the [profil_initial_page] screen.

// ignore_for_file: must_be_immutable

class ProfilInitialModel extends Equatable {
  ProfilInitialModel({
    this.functionItemList = const [],
    this.listplaytwoOneItemList = const [],
  });

  List<FunctionItemModel> functionItemList;
  List<ListplaytwoOneItemModel> listplaytwoOneItemList;

  ProfilInitialModel copyWith({
    List<FunctionItemModel>? functionItemList,
    List<ListplaytwoOneItemModel>? listplaytwoOneItemList,
  }) {
    return ProfilInitialModel(
      functionItemList: functionItemList ?? this.functionItemList,
      listplaytwoOneItemList: listplaytwoOneItemList ?? this.listplaytwoOneItemList,
    );
  }

  @override
  List<Object?> get props => [functionItemList, listplaytwoOneItemList];
}
