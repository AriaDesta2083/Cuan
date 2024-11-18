part of 'dataplan_bloc.dart';

sealed class DataplanState extends Equatable {
  const DataplanState();
  
  @override
  List<Object> get props => [];
}

final class DataplanInitial extends DataplanState {}
final class DataplanLoading extends DataplanState {}
final class DataplanFailed extends DataplanState {
  final String e;
  const DataplanFailed(this.e);
  @override
  List<Object> get props => [e];
}
final class DataplanBuySuccess extends DataplanState {}

final class DataplanProviderSuccess extends DataplanState {
  final List<DataProviderModel> listData;
  const DataplanProviderSuccess(this.listData);
  @override
  List<Object> get props => [listData];
}
