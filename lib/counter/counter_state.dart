part of 'counter_bloc.dart';

class CounterState extends Equatable {
  int counter;

  @override
  List<Object?> get props => [counter];

  CounterState({
    required this.counter,
  });

  CounterState copyWith({int? counter}) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
