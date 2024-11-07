part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UsertGetRecent extends UserEvent {}

class UserGetByUsername extends UserEvent {
  final String usrnm;
  const UserGetByUsername(this.usrnm);

  @override
  List<Object> get props => [usrnm];
}

class UserGetRecentUser extends UserEvent {}
