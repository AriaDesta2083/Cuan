import 'package:bloc/bloc.dart';
import 'package:cuan/shared/history_method.dart';
import 'package:equatable/equatable.dart';
import 'package:cuan/models/transaction_model.dart';
import 'package:cuan/service/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          if (event.limit != 0) {
            emit(TransactionLoading());
            final res = await TransactionServices().getTransaction(event.limit);
            emit(TransactionSuccess(res));
          } else {
            emit(TransactionLoading());
            final data = await TransactionServices().getTransaction(event.limit);
            final res = await groupDataByKey(data);
            emit(TransactionHistorySuccess(res));
          }
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
