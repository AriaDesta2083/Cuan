import 'package:bloc/bloc.dart';
import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/service/data_plan_services.dart';
import 'package:cuan/service/transaction_service.dart';
import 'package:equatable/equatable.dart';

part 'dataplan_event.dart';
part 'dataplan_state.dart';

class DataplanBloc extends Bloc<DataplanEvent, DataplanState> {
  DataplanBloc() : super(DataplanInitial()) {
    on<DataplanEvent>((event, emit) async {

      if (event is DataPlanBuy) {
        try {
          emit(DataplanLoading());
          await TransactionServices().buyData(event.data); 
          emit(DataplanBuySuccess());

        } catch (e) {
          emit(DataplanFailed(e.toString()));
        }
      }
      if (event is DataPlanProvider) {
        try {
          emit(DataplanLoading());
          final res = await DataPlansServices().getDataProvier(); 
          emit(DataplanProviderSuccess(res));

        } catch (e) {
          emit(DataplanFailed(e.toString()));
        }
      }
    
    
    });
  }
}
