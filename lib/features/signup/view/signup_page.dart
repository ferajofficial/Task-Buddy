import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signup/constants/signup_form.dart';
import 'package:task_buddy/shared/global_loader.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupView();
  }
}

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isLoading = true;
  final authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    // Simulate a 1-second delay using Future.delayed
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Set isLoading to false after the delay
      });
    });
    authenticationBloc.add(AuthenticationInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) async {
        if (state is AuthLoadingState) {}
        if (state is AuthLoadedState) {}
        if (state is AuthSuccessState) {
          context.navigateTo(const HomeRoute());
        }
        if (state is AuthFailureState) {}
      },
      buildWhen: (previous, current) => current is! AuthActionState,
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const LoadingWidget();
        } else if (state is AuthLoadedState) {
          return Scaffold(
            body: SignUpForm(authenticationBloc: authenticationBloc),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
