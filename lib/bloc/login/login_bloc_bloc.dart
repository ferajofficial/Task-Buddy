// import 'package:bloc/bloc.dart';
// import 'package:task_buddy/bloc/login/login_bloc_event.dart';
// import 'package:task_buddy/bloc/login/login_bloc_state.dart';
// import 'package:task_buddy/repositories/authentication/auth_repos.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc({
//     required AuthenticationRepository authenticationRepository,
//   }) : super(const LoginState()) {
//     on<LoginEmailChanged>(_onEmailChanged);
//     on<LoginPasswordChangedEvent>(_onPasswordChanged);
//     on<LoginSubmittedEvent>(_onsubmitted);
//   }

//   void _onEmailChanged(
//     LoginEmailChanged event,
//     Emitter<LoginState> emit,
//   ) {
//     emit(
//       state.copyWith(
//         email: '',
//         password: '',
//       ),
//     );
//   }

//   void _onPasswordChanged(
//     LoginPasswordChangedEvent event,
//     Emitter<LoginState> emit,
//   ) {
//     emit(
//       state.copyWith(
//         password: '',
//         email: '',
//       ),
//     );
//   }

//   Future<void> _onsubmitted(
//     LoginSubmittedEvent event,
//     Emitter<LoginState> emit,
//   ) async {
   
//   }
// }
