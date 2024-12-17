part of 'signup_ekran_bloc.dart';

/// Abstract class for all events that can be dispatched from the SignupEkran widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class SignupEkranEvent extends Equatable {
  const SignupEkranEvent();

  @override
  List<Object> get props => [];
}

/// Event that is dispatched when the SignupEkran widget is first created.
class SignupEkranInitialEvent extends SignupEkranEvent {
  const SignupEkranInitialEvent();

  @override
  List<Object> get props => [];
}
