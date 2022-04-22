import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  /* PUBLIC METHOD */
  void increment() {
    final newState = state.copyWith(counter: state.counter + 1);
    print(newState);
    emit(newState);
    // emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
