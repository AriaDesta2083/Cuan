import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cuan/models/signin_form_model.dart';
import 'package:cuan/models/signup_form_model.dart';
import 'package:cuan/models/update_user_form_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/auth_service.dart';
import 'package:cuan/service/wallet_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthServices().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah digunakan'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final res = await AuthServices().register(event.data);
          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final res = await AuthServices().login(event.data);
          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthGetCurrent) {
        try {
          emit(AuthLoading());
          SignInFormModel data = await AuthServices().getCredentialFromLocal();
          UserModel res = await AuthServices().login(data);
          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdate) {
        try {
          emit(AuthLoading());
          await AuthServices().updateUser(event.newData);
          emit(AuthSuccess(event.data.copyWith(
            name: event.newData.name,
            username: event.newData.username,
            email: event.newData.email,
            password: event.newData.password,
          )));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthPin) {
        try {
          emit(AuthLoading());
          await WalletServices().updatePin(event.data.pin!, event.newPin);
          emit(AuthSuccess(event.data.copyWith(pin: event.newPin)));
        } catch (e) {
          rethrow;
        }
      }
      if (event is AuthBalance) {
        try {
          emit(AuthLoading());
          final int res = await WalletServices().getBalance();
          emit(AuthSuccess(event.data.copyWith(balance: res)));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthServices().logout();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
