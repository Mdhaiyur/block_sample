part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState
{
  bool isAuthenticated;
  Authenticated({required this.isAuthenticated});

  @override
  List<Object?> get props => [isAuthenticated];

}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends AuthState {
  final User user;
  LoginSuccess({required this.user});

  @override
  List<Object?> get props => [user];

  LoginSuccess copyWith({
    User? user,
  }) {
    return LoginSuccess(
      user: user ?? this.user,
    );
  }
}

class AuthFailed extends AuthState {
  String errorMessage;

  AuthFailed({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
