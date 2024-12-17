part of 'login_ekran_bloc.dart';

/// Abstract class for all events that can be dispatched from the LoginEkran widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class LoginEkranEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event that is dispatched when the LoginEkran widget is first created.
class LoginEkranInitialEvent extends LoginEkranEvent {
  @override
  List<Object> get props => [];
}
