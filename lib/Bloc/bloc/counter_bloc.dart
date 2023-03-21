import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounter) {
        emit(state + 1);
      } else if (event is DecrementCounter) {
        emit(state - 1);
      }
    });
  }
}
