import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signin/constants/signin_form.dart';
import 'package:task_buddy/shared/global_loader.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class SigninPage extends StatelessWidget {
  const SigninPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SigninView();
  }
}

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  bool isLoading = true;
  final authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    authenticationBloc.add(AuthenticationInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) async {
        log('state : $state');
        if (state is AuthLoadingState) {
          log('Authentication loading');
        }
        if (state is AuthLoadedState) {
          log('Authentication loaded');
        }
        if (state is AuthSuccessState) {
          log('Authentication Success');
          context.router.replaceAll([const HomeRoute()]);
        }
        if (state is AuthFailureState) {
          log('Authentication Failed');
          // context.router.replaceAll([const SigninRoute()]);
          authenticationBloc.add(AuthenticationInitialEvent());
        }
      },
      buildWhen: (previous, current) => current is! AuthActionState,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              SigninForm(authenticationBloc: authenticationBloc),
              state is AuthLoadingState
                  ? AlertDialog(
                      elevation: 10,
                      content: const LoadingWidget().h(50),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
