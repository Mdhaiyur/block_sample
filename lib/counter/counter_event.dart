part of 'counter_bloc.dart';


abstract class CounterEvent {
  const CounterEvent();
}

class IncrementNumber extends CounterEvent{
  const IncrementNumber({required this.counter});
  final int counter;
}

class DecrementNumber extends CounterEvent{
  const DecrementNumber({required this.counter});
  final int counter;
}