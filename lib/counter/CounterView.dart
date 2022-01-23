import 'package:block_sample/connectivity/connectivity_cubit.dart';
import 'package:block_sample/connectivity/connectivity_cubit.dart';
import 'package:block_sample/connectivity/enums.dart';
import 'package:block_sample/counter/counter_bloc.dart';
import 'package:block_sample/counter/counter_cubic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build metho recreated');
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityConnected) {
          if (state.connectivityTyps == ConnectivityTyps.mobile) {
            print('mobile');
          } else if (state.connectivityTyps == ConnectivityTyps.wifi) {
            print('Wifi');
          }
        } else if (state is ConnectivityDisconnected) {
          print('disconnected');
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Expanded(
                  child: Center(
                      child: Text(
                    'Counter using Bloc ${state.counter.toString()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 50),
                  )),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().incrementNumber();
                //context.read<CounterCubic>().increment();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().decrementNumber();
                // context.read<CounterCubic>().decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
