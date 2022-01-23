import 'package:bloc/bloc.dart';

class CounterCubic extends Cubit<int> {
  CounterCubic() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
