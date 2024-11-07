import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cuan/models/payment_model.dart';
import 'package:cuan/service/payment_service.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is PaymentMethodGet) {
        try {
          emit(PaymentLoading());

          final res = await PaymentMethodService().getListPaymentMethod();

          emit(PaymentSuccess(res));
        } catch (e) {
          emit(PaymentFailed(e.toString()));
        }
      }
    });
  }
}
