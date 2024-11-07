part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionGet extends TransactionEvent {
  final int limit;
  const TransactionGet(this.limit);
  @override
  // TODO: implement props
  List<Object> get props => [limit];
}
