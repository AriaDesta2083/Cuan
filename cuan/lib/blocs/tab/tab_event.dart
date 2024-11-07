part of 'tab_bloc.dart';

sealed class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends TabEvent {
  final int index;
  const TabChange(this.index);
  @override
  List<Object> get props => [index];
}
