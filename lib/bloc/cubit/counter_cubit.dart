import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterVaue: 0, isIncremented: false));

  void increment() => emit(
      CounterState(counterVaue: state.counterVaue + 1, isIncremented: true));

  void decrement() => emit(
      CounterState(counterVaue: state.counterVaue - 1, isIncremented: false));
}
