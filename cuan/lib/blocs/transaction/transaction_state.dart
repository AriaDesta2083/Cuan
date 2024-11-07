part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionFailed extends TransactionState {
  final String e;
  const TransactionFailed(this.e);
  @override
  List<Object> get props => [e];
}

final class TransactionSuccess extends TransactionState {
  final List<TransactionModel> listData;
  const TransactionSuccess(this.listData);
  @override
  List<Object> get props => [listData];

}
final class TransactionHistorySuccess extends TransactionState {
  final Map<String, List<TransactionModel>> grupData;
  const TransactionHistorySuccess(this.grupData);
  @override
  List<Object> get props => [grupData];

}
