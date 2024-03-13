import 'package:bloc/bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/repositories/authentication/auth_repos.dart';
import 'package:task_buddy/utils/enums.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepo _authenticationRepo = AuthenticationRepo();

  AuthenticationBloc(
    AuthenticationState initialState,
  ) : super(initialState) {
    on<OnButtonPressEvent>(_onButtonPressed);
  }
  void _onButtonPressed(
    OnButtonPressEvent event,
    Emitter<AuthenticationState> emit
  ) async {
    await _authenticationRepo.login(event.email, event.password).then((value) {
      emit(state.copyWith(authStatus: AuthenticationStatus.successful));
    }).onError((error, stackTrace) {
      emit(state.copyWith(authStatus: AuthenticationStatus.failed));
    });
  }
}
