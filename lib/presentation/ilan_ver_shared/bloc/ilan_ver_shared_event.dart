part of 'ilan_ver_shared_bloc.dart';

/// Abstract class for all events that can be dispatched from the Ilanver widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class IlanVerSharedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event that is dispatched when the Ilanver widget is first created.
class IlanverSharedInitialEvent extends IlanVerSharedEvent {
  @override
  List<Object> get props => [];
}
