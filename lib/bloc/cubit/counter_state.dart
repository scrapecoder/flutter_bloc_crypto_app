part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterVaue;
  final bool isIncremented;

  CounterState({required this.counterVaue, required this.isIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterVaue];
}
