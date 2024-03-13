import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];

  // AppState copyWith() {
  //   return AppState();
  // }
}

class AppInitialState extends AppState {
  const AppInitialState();
}

class AppLoadingState extends AppState {
  const AppLoadingState();
}

class AppLoadedState extends AppState {
  const AppLoadedState();
}

class AppSuccessState extends AppState {
  const AppSuccessState();
}

class AppFailureState extends AppState {
  final String message;
  const AppFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

class UserAuthenticatedState extends AppState {
  const UserAuthenticatedState();
}

class UserUnAuthenticatedState extends AppState {
  const UserUnAuthenticatedState();
}

class AppLogout extends AppState {
  const AppLogout();
}
