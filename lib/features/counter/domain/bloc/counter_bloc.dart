
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';



class CounterBlock extends Bloc<ClickEvent, CounterState>{

  CounterBlock() : super(CounterState(0)) {

    on<ClickEvent>((event, emit) {
      if (event is Increment) {
        emit(CounterState(state.value +1));
      } else {
        emit(CounterState(state.value - 1));
      }

    });
  }

}