part of 'ilan_ver_detail_bloc.dart';

/// Abstract class for all events that can be dispatched from the Ilanver widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class IlanVerDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event that is dispatched when the Ilanver widget is first created.
class IlanverDetailInitialEvent extends IlanVerDetailEvent {
  @override
  List<Object> get props => [];
}
