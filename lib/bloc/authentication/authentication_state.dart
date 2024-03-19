import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  // final AuthenticationStatus authStatus;
  const AuthenticationState();
  @override
  List<Object?> get props => [];

  AuthenticationState copyWith() {
    return const AuthenticationState();
  }
}

class AuthInitialState extends AuthenticationState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthenticationState {
  final String email;
  final String password;
  const AuthLoadingState(
    this.email,
    this.password,
  ) : super();
}

class AuthLoadedState extends AuthenticationState {
  const AuthLoadedState();
}

class AuthSuccessState extends AuthenticationState {
  const AuthSuccessState();
}

class AuthFailureState extends AuthenticationState {
  final String message;
  const AuthFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}
