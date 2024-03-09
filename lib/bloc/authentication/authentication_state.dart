import 'package:equatable/equatable.dart';
import 'package:task_buddy/utils/enums.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus authStatus;
  const AuthenticationState({required this.authStatus});
  @override
  List<Object?> get props => [authStatus];

  AuthenticationState copyWith({required AuthenticationStatus authStatus}) {
    return AuthenticationState(authStatus: authStatus);
  }
}

class AuthLoadingState extends AuthenticationState {
  const AuthLoadingState({required super.authStatus});
}

class AuthSuccessState extends AuthenticationState {
  final String email;
  const AuthSuccessState(this.email, {required super.authStatus});
}

class AuthFailureState extends AuthenticationState {
  final String message;
  const AuthFailureState({required super.authStatus, this.message = ''});
  @override
  List<Object?> get props => [message];
}
