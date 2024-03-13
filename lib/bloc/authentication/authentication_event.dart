abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class OnButtonPressEvent extends AuthenticationEvent {
  const OnButtonPressEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
