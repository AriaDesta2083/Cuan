part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrent extends AuthEvent {}

class AuthLogout extends AuthEvent {}

class AuthUpdate extends AuthEvent{
  final UserModel data;
  final UpdateUserFormModel newData;
  const AuthUpdate(this.data,this.newData);
  
  @override
  List<Object> get props => [data];
}

class AuthPin extends AuthEvent{
  final UserModel data;
  final String newPin;
  const AuthPin(this.data,this.newPin);

  @override
  List<Object> get props => [data,newPin];
}

class AuthBalance extends AuthEvent {
  final UserModel data;
  const AuthBalance(this.data);
  @override
  List<Object> get props => [data];
}