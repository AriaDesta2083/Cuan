import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cuan/models/topup_model.dart';
import 'package:cuan/service/transaction_service.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopUpPost) {
        try {
          emit(TopupLoading());
          final res = await TransactionServices().topUp(event.data); 
          emit(TopupSuccess(res));
        } catch (e) {
          emit(TopupFailed(e.toString()));
        }
      }
    });
  }
}
