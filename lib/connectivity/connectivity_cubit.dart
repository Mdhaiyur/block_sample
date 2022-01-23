import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'enums.dart';


part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState>
{
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  ConnectivityCubit({required this.connectivity}) : super(ConnectivityInitial()) {
    getConnectivityState();
  }

  StreamSubscription<ConnectivityResult> getConnectivityState(){
    return connectivityStreamSubscription=connectivity.onConnectivityChanged.listen((connectivityResult) {

      print(connectivityResult.name);
      if(connectivityResult.name == ConnectivityTyps.mobile.name){
        emit(ConnectivityConnected(connectivityTyps: ConnectivityTyps.mobile));
      }else if(connectivityResult.name == ConnectivityTyps.wifi.name){
        emit(ConnectivityConnected(connectivityTyps: ConnectivityTyps.wifi));
      }else{
        emit(ConnectivityDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
