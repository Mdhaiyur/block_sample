part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState extends Equatable{

}

class ConnectivityInitial extends ConnectivityState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ConnectivityConnected extends ConnectivityState{
  final ConnectivityTyps connectivityTyps;
  ConnectivityConnected({required this.connectivityTyps});

  @override
  // TODO: implement props
  List<Object?> get props => [connectivityTyps];
}

class ConnectivityDisconnected extends ConnectivityState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
