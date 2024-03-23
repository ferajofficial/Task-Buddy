import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationInitialEvent extends AuthenticationEvent {}

class OnSignInEvent extends AuthenticationEvent {
  const OnSignInEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

class OnSignUpEvent extends AuthenticationEvent {
  const OnSignUpEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
  final String userName;
  final String email;
  final String password;
}

class OnSignOutEvent extends AuthenticationEvent {

}
