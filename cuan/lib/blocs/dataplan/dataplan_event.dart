part of 'dataplan_bloc.dart';

sealed class DataplanEvent extends Equatable {
  const DataplanEvent();

  @override
  List<Object> get props => [];
}

class DataPlanBuy extends DataplanEvent {
  final DataFormModel data;
  const DataPlanBuy(this.data);
  @override
  List<Object> get props => [data];
}

class DataPlanProvider extends DataplanEvent {}
