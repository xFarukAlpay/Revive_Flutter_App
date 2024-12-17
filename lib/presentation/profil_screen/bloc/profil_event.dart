part of 'profil_bloc.dart';

/// Abstract class for all events that can be dispatched from the Profil widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class ProfilEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Profil widget is first created.
class ProfilInitialEvent extends ProfilEvent {
  @override
  List<Object?> get props => [];
}
