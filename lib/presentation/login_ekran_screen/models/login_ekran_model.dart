import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [login_ekran_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LoginEkranModel extends Equatable {
  // You can define properties here if needed.

  LoginEkranModel();

  // copyWith method to return a new instance with updated fields if any.
  LoginEkranModel copyWith() {
    return LoginEkranModel();
  }

  @override
  List<Object?> get props => [];
}
