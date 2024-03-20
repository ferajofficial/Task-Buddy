import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/repositories/authentication/auth_repos.dart';
import 'package:task_buddy/utils/app_constants.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepo _authenticationRepo = AuthenticationRepo();

  AuthenticationBloc() : super(AuthInitialState()) {
    on<AuthenticationInitialEvent>(_onInitialEvent);
    on<OnSignInEvent>(_onSignIn);
    on<OnSignUpEvent>(_onSignUp);
  }

//For SignIn
  FutureOr<void> _onSignIn(OnSignInEvent event, Emitter<AuthenticationState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(AuthLoadingState());
    try {
      final result = await _authenticationRepo.signin(event.email, event.password);

      if (result.status == true) {
        prefs.setString(AppConstatns.studentId, '${result.id}');
        emit(AuthSuccessState(signInResponseModel: result));
      } else {
        emit(AuthFailureState(
          message: result.message ?? 'Failed to login! Please try again.',
        ));
      }
    } catch (e) {}
  }

//Initially
  FutureOr<void> _onInitialEvent(
      AuthenticationInitialEvent event, Emitter<AuthenticationState> emit) async {
    // await Future.delayed(const Duration(seconds: 2));
    log('emiting loaded state');
    emit(AuthLoadedState());
  }

//For SignUp
  FutureOr<void> _onSignUp(OnSignUpEvent event, Emitter<AuthenticationState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(AuthLoadingState());
    try {
      final result = await _authenticationRepo.signup(event.email, event.password, event.userName);
      if (result.message == 'User already exists') {
        emit(AuthFailureState(
          message: result.message ?? 'User already exists',
        ));
      } else if (result.message == 'User signedup successfully') {
        prefs.setString(AppConstatns.studentId, '${result.user?.id}');
        emit(AuthSuccessState(signUpResponseModel: result));
      }
    } catch (e) {}
  }
}
