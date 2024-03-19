import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/app/app_bloc.dart';
import 'package:task_buddy/bloc/app/app_state.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signin/constants/signin_options.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:task_buddy/shared/custom_form.dart';
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
  // AuthenticationBloc? authenticationBloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: BlocProvider.of<AppBloc>(context),
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: isLoading
                  ? const CircularProgressIndicator().centered()
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              R.ASSETS_ILLUSTRATIONS_SIGNIN_SVG,
                              height: 200,
                            ),
                          ),
                          20.heightBox,
                          Text(
                            "Welcome Back!!",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // 20.heightBox,
                          const CustomText(
                            text: "Good to see you again 😅",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          // 10.heightBox,
                          const CustomForm(
                            buttonTxt: 'Sign in',
                          ),
                          // 5.heightBox,
                          15.heightBox,
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                context.navigateTo(const SignupRoute());
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          25.heightBox,
                          const SigninWithGoogle(),
                        ],
                      ).p12(),
                    ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthSuccessState) {
            context.navigateTo(const HomeRoute());
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AppLoadingState) {
            log('into the ApploadingState');
          }
        });
  }
}
