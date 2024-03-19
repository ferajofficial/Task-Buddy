import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:task_buddy/bloc/app/app_bloc.dart';
import 'package:task_buddy/bloc/app/app_event.dart';
import 'package:task_buddy/bloc/app/app_state.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/const/router/router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _appStartedBloc = AppBloc();

  @override
  void initState() {
    super.initState();
    _appStartedBloc.add(const AppInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _appStartedBloc,
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Lottie.asset(
              R.ASSETS_ILLUSTRATIONS_SPLASH_JSON,
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is AppSuccessState) {
          log('into the AppSuccessState');

          context.navigateTo(const SigninRoute());
        }
        if (state is AppLoadingState) {
          log('into the ApploadingState');
        }
        if (state is AppLoadedState) {
          log('inot the AppLoadedState');

          const CircularProgressIndicator();
        }
      },
    );
  }
}
