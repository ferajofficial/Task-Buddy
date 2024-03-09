abstract class AuthenticationEvent {
  const AuthenticationEvent();
}



class ButtonPressedEvent extends AuthenticationEvent {
  const ButtonPressedEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
