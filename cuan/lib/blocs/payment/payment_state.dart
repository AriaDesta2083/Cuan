part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentFailed extends PaymentState {
  final String e;
  const PaymentFailed(this.e);
  @override
  List<Object> get props => [e];
}

final class PaymentSuccess extends PaymentState {
  final List<PaymentModel> listData;
  const PaymentSuccess(this.listData);
  @override
  // TODO: implement props
  List<Object> get props => [listData];
}
