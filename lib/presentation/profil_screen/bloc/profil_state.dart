part of 'profil_bloc.dart';

/// Represents the state of Profil in the application.

// ignore_for_file: must_be_immutable

class ProfilState extends Equatable {
  ProfilState({
    this.searchController,
    this.profilInitialModelObj,
    this.profilModelObj,
  });

  TextEditingController? searchController;
  ProfilModel? profilModelObj;
  ProfilInitialModel? profilInitialModelObj;

  @override
  List<Object?> get props => [
    searchController,
    profilInitialModelObj,
    profilModelObj,
  ];

  ProfilState copyWith({
    TextEditingController? searchController,
    ProfilInitialModel? profilInitialModelObj,
    ProfilModel? profilModelObj,
  }) {
    return ProfilState(
      searchController: searchController ?? this.searchController,
      profilInitialModelObj:
      profilInitialModelObj ?? this.profilInitialModelObj,
      profilModelObj: profilModelObj ?? this.profilModelObj,
    );
  }
}
