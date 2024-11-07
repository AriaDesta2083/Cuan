import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/user_sevice.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async{
      

      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());
          final res = await UserServices().getUserByUsername(event.usrnm);
          emit(UserSuccess(res));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
      if (event is UserGetRecentUser) {
        try {
          emit(UserLoading());
          final res = await UserServices().getRecentUser();
          emit(UserSuccess(res));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
