part of 'ilan_bloc.dart';

/// Represents the state of Ilan in the application.
// ignore_for_file: must_be_immutable
class IlanState extends Equatable {
  IlanState({this.searchController, this.ilanModelObj});

  TextEditingController? searchController;
  IlanModel? ilanModelObj;

  @override
  List<Object?> get props => [searchController, ilanModelObj];
  IlanState copyWith({
    TextEditingController? searchController,
    IlanModel? ilanModelObj,
  }) {
    return IlanState(
      searchController: searchController ?? this.searchController,
      ilanModelObj: ilanModelObj ?? this.ilanModelObj,
    );
  }
}
