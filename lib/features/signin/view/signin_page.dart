import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signin/constants/signin_options.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:task_buddy/shared/custom_form.dart';
import 'package:task_buddy/utils/enums.dart';
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
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          switch (state.authStatus) {
            case AuthenticationStatus.successful:
              context.navigateTo(const HomeRoute());
              print('Authentication successful');
              const SnackBar(
                content: CustomText(text: 'Authentication successful'),
              );
              break;

            case AuthenticationStatus.failed:
              print('Authentication failed');
              const SnackBar(
                content: CustomText(text: 'Authentication failed'),
              );
              break;
            case AuthenticationStatus.loading:
              print('Authentication loading');
              // context.navigateTo(const HomeRoute());
              const SnackBar(
                content: CustomText(text: 'Authentication successful'),
              );
              break;
          }
          return SafeArea(
            child:
                // isLoading
                //     ? const CircularProgressIndicator().centered()
                //     :
                Column(
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
                const SigninOptions(),
              ],
            ).p12(),
          );
        },
      ),
    );
  }
}
