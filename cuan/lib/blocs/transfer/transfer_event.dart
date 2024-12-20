part of 'transfer_bloc.dart';

sealed class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}



class TransferPost extends TransferEvent {
  final TransferModel data;
  const TransferPost(this.data);
  @override
  List<Object> get props => [data];
}