import 'package:flutter/material.dart';
import 'package:task_buddy/models/signin_model.dart';
import 'package:task_buddy/models/signup_model.dart';

@immutable
abstract class AuthenticationState {
  // final AuthenticationStatus authStatus;
  const AuthenticationState();
}

abstract class AuthActionState extends AuthenticationState {}

class AuthInitialState extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthLoadedState extends AuthenticationState {}

class AuthSuccessState extends AuthActionState {
  final SignInModel? signInResponseModel;
  final SignUpModel? signUpResponseModel;
  AuthSuccessState({
    this.signInResponseModel,
    this.signUpResponseModel,
  });
}

class AuthFailureState extends AuthActionState {
  final String message;
  AuthFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthenticationErrorState extends AuthActionState {}
