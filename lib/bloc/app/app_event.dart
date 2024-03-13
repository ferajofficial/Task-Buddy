import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitialEvent extends AppEvent {
  const AppInitialEvent();
}

class AppLoadedEvent extends AppEvent {
  const AppLoadedEvent();
}

class AppLoadingEvent extends AppEvent {
  const AppLoadingEvent();
}

class AppSuccessEvent extends AppEvent {
  const AppSuccessEvent();
}

class AppFailureEvent extends AppEvent {
  final String message;
  const AppFailureEvent({required this.message});
  @override
  List<Object> get props => [message];
}

class UserAuthenticatedEvent extends AppEvent {
  const UserAuthenticatedEvent();
}

class UserUnAuthenticatedEvent extends AppEvent {
  const UserUnAuthenticatedEvent();
}

class AppLogoutEvent extends AppEvent {
  const AppLogoutEvent();
}
