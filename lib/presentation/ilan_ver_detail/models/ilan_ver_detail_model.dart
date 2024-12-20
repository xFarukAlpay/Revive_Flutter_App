import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [ilan_ver_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class IlanVerDetailModel extends Equatable {
  // You can define properties here if needed.

  IlanVerDetailModel();

  // copyWith method to return a new instance with updated fields if any.
  IlanVerDetailModel copyWith() {
    return IlanVerDetailModel();
  }

  @override
  List<Object?> get props => [];
}
