import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>
{
  CounterBloc() : super(CounterState(counter: 0)){
    on<IncrementNumber>(increment);
    on<DecrementNumber>(decrement);
  }

  void increment(IncrementNumber event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: event.counter));
  }

  void decrement(DecrementNumber event, Emitter<CounterState> emit) {
    emit(CounterState(counter: event.counter));
  }

  void incrementNumber(){
    int number=state.counter;
    number=number+1;
    add(IncrementNumber(counter: state.counter++));
  }

  void decrementNumber(){
    int number=state.counter;
    number=number-1;
    add(DecrementNumber(counter: number));
  }

}
