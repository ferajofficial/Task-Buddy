import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateBasedOnUser();
    Timer(
      const Duration(seconds: 2),
      () =>
          AutoRouter.of(context).replace(const SigninRoute()),
    );
  }
  Future<void> navigateBasedOnUser() async {
    // bool isNew = await isNewUser();
    // bool isSigned = await isSignedIn();
    // bool isLoggedIn = await isLoggedIn();

    // Navigate based on user status
    // if (isNew) {
    //   AutoRouter.of(context).replace(const SignupRoute());
    // } else if (isSigned) {
    //   AutoRouter.of(context).replace(const SigninRoute());
    // } else if (isLoggedIn) {
    //   AutoRouter.of(context).replace(const HomeRoute());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(R.ASSETS_ILLUSTRATIONS_SPLASH_JSON),
      ),
    );
  }
}
