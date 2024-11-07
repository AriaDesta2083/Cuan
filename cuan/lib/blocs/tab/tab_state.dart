part of 'tab_bloc.dart';

sealed class TabState extends Equatable {
  const TabState({required this.index});
  final int index;
  @override
  List<Object> get props => [];
}

final class TabInitial extends TabState {
  const TabInitial({required super.index});
  @override
  List<Object> get props => [index];
}
