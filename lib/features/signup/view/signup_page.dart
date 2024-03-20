import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signup/constants/signup_options.dart';
import 'package:task_buddy/shared/custom_form.dart';
import 'package:task_buddy/shared/custom_loader.dart';
import 'package:velocity_x/velocity_x.dart';

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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(R.ASSETS_ILLUSTRATIONS_SIGNUP_SVG, height: 200),
                    ),
                    20.heightBox,
                    Text(
                      "Create an account",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "We're keen to have you on board 😊",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    20.heightBox,
                    CustomForm(
                      buttonTxt: 'Sign up',
                      isAdditionalTextField: true,
                      additionalTextFieldName: "username",
                      additionalTextFieldValidator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(3),
                      ]),
                      additionalTextFieldDecoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Enter your username",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      authenticationBloc: authenticationBloc,
                    ),
                    // 20.heightBox,
                    // CustomButton(
                    //   width: double.infinity,
                    //   height: 50,
                    //   buttonTxt: 'Sign up',
                    //   onPressed: () {
                    //     context.navigateTo(const HomeRoute());
                    //   },
                    // ),
                    20.heightBox,
                    GestureDetector(
                      onTap: () {
                        context.popRoute();
                      },
                      child: RichText(
                          text: TextSpan(
                              text: "Have an account ? ",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              children: [
                            TextSpan(
                              text: "Sign in",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            )
                          ])),
                    ).centered(),
                    15.heightBox,
                    const SignupWithGoogle()
                  ],
                ).p12(),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
