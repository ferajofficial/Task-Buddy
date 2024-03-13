import 'package:equatable/equatable.dart';
import 'package:task_buddy/utils/enums.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus authStatus;
  const AuthenticationState({this.authStatus = AuthenticationStatus.loading});
  @override
  List<Object?> get props => [authStatus];

  AuthenticationState copyWith({required AuthenticationStatus authStatus}) {
    return AuthenticationState(authStatus: authStatus);
  }
}

class AuthLoadingState extends AuthenticationState {
  final String email;
  final String password;
  const AuthLoadingState(this.email, this.password,
      {required super.authStatus});
}

class AuthInitial extends AuthenticationState {
  const AuthInitial({required super.authStatus});
}

class AuthenticatedState extends AuthenticationState {
  const AuthenticatedState({required super.authStatus});
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState({required super.authStatus});
}

class AuthLoadedState extends AuthenticationState {
  const AuthLoadedState({required super.authStatus});
}

class AuthSuccessState extends AuthenticationState {
  const AuthSuccessState({required super.authStatus});
}

class AuthFailureState extends AuthenticationState {
  final String message;
  const AuthFailureState({required super.authStatus, this.message = ''});
  @override
  List<Object?> get props => [message];
}
