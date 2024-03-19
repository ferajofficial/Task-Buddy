import 'dart:async';
import 'dart:developer';

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
      : super(AuthInitialState()) {
    on<OnInitialEvent>(_onInitialEvent);
    on<OnSignInEvent>(_onSignIn);
    on<OnSignUpEvent>(_onSignUp);
  }

//For SignIn
  FutureOr<void> _onSignIn(
      OnSignInEvent event, Emitter<AuthenticationState> emit) async {
    // emit(AuthLoadingState());
    final result =
        await _authenticationRepo.signin(event.email, event.password);
    log('Result : $result');
    if (result.status == true) {
      log('Going to Success State');
      emit(AuthSuccessState());
    } else {
      log('Going to failed State');

      emit(AuthFailureState(
        message: result.message ?? 'Failed to login! Please try again.',
      ));
    }
  }

//Initially
  FutureOr<void> _onInitialEvent(
      OnInitialEvent event, Emitter<AuthenticationState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthLoadedState());
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
    } else if (result.message == 'User signedup successfully') {
      emit(AuthSuccessState());
    }
  }
}
