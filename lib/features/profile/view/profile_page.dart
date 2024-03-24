import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/profile/constants/profile_body.dart';
import 'package:task_buddy/shared/global_alert.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isLoading = true;
  final authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false; // Set isLoading to false after the delay
      });
    });
    // authenticationBloc.add(AuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) {
        if (state is AuthSignOutState) {
          log('state : $state');
          context.router.replaceAll([const SigninRoute()]);
        }
      },
      buildWhen: (previous, current) => current is! AuthActionState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.maybePop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            centerTitle: true,
            title: const GlobalText(
              text: "Profile",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.light_rounded,
                    size: 30,
                  ),
                ).h(40).w(40),
              ),
            ],
          ),
          body: Stack(children: [
            ProfileBody(authenticationBloc: authenticationBloc),
            state is AuthLoadingState
                ? const GlobalAlert(
                    loadingText: 'Logging Out..',
                  )
                : Container()
          ]),
        );
      },
    );
  }
}
