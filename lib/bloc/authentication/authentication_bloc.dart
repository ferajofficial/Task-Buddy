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
  }

  FutureOr<void> _onSignIn(
      OnSignInEvent event, Emitter<AuthenticationState> emit) async {
    // emit(AuthLoadingState(
    //   event.email,
    //   event.password,
    // ));
    final result =  await _authenticationRepo.login(event.email, event.password);
    if (result.status == true) {
      emit(const AuthSuccessState());
    } else {
      emit(AuthFailureState(
        message: result.message ?? 'Failed to login! Please try again.',
      ));
    }
    //     .then((value) {
    //   emit(AuthLoadingState(
    //     event.email,
    //     event.password,
    //   ));
    //   emit(const AuthLoadedState());
    //   if ( == true) {
    //     emit(const AuthSuccessState());
    //   } else {
    //     emit(AuthFailureState(
    //       message: value['message'],
    //     ));
    //   }
    // })
    // .catchError((e) {
    //   emit(AuthFailureState(message: e.toString()));
    // });
  }

  FutureOr<void> _onInitialEvent(
      OnInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(const AuthLoadedState());
  }
}
