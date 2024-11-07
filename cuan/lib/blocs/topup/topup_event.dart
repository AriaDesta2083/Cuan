part of 'topup_bloc.dart';

sealed class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}


class TopUpPost extends TopupEvent{
  final TopUpModel data;
  const TopUpPost(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}