import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabInitial(index: 0)) {
    on<TabEvent>((event, emit) {
      if (event is TabChange) {
        emit(TabInitial(index: event.index));
      }
    });
  }
}
