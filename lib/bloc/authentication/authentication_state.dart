import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState {
  // final AuthenticationStatus authStatus;
  const AuthenticationState();
}

abstract class AuthActionState extends AuthenticationState {}

class AuthInitialState extends AuthenticationState {

}

class AuthLoadingState extends AuthenticationState {}

class AuthLoadedState extends AuthenticationState {

}

class AuthSuccessState extends AuthenticationState {

}

class AuthFailureState extends AuthenticationState {
  final String message;
  const AuthFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}
