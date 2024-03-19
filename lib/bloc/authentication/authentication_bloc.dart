import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/repositories/authentication/auth_repos.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepo _authenticationRepo = AuthenticationRepo();

  AuthenticationBloc(
      // AuthenticationState initialState,
      )
      : super(const AuthInitialState()) {
    on<OnInitialEvent>(_onInitialEvent);
    on<OnSignInEvent>(_onSignIn);
    on<OnSignUpEvent>(_onSignUp);
  }

//For SignIn
  FutureOr<void> _onSignIn(
      OnSignInEvent event, Emitter<AuthenticationState> emit) async {
    final result =
        await _authenticationRepo.signin(event.email, event.password);
    if (result.status == true) {
      emit(const AuthSuccessState());
    } else {
      emit(AuthFailureState(
        message: result.message ?? 'Failed to login! Please try again.',
      ));
    }
  }

//Initially
  FutureOr<void> _onInitialEvent(
      OnInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(const AuthLoadedState());
  }

//For SignUp
  FutureOr<void> _onSignUp(
      OnSignUpEvent event, Emitter<AuthenticationState> emit) async {
    final result = await _authenticationRepo.signup(
        event.email, event.password, event.userName);
    if (result.message == 'User already exists') {
      emit(AuthFailureState(
        message: result.message ?? 'User already exists',
      ));
    } else {
      emit(const AuthSuccessState());
    }
  }
}
