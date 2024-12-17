part of 'ilan_bloc.dart';

/// Abstract class for all events that can be dispatched from the Ilan widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class IlanEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Ilan widget is first created.
class IlanInitialEvent extends IlanEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing ChipView selection.
// ignore_for_file: must_be_immutable
class UpdateChipViewEvent extends IlanEvent {
  UpdateChipViewEvent({required this.index, this.isSelected});

   int index;
   bool? isSelected;

  @override
  List<Object?> get props => [index, isSelected];
}
