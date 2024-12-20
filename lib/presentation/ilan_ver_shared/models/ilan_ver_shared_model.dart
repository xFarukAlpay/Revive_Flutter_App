import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [ilan_ver_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class IlanVerSharedModel extends Equatable {
  // You can define properties here if needed.

  IlanVerSharedModel();

  // copyWith method to return a new instance with updated fields if any.
  IlanVerSharedModel copyWith() {
    return IlanVerSharedModel();
  }

  @override
  List<Object?> get props => [];
}
