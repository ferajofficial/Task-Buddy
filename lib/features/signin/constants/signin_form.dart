import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/signin/constants/signin_options.dart';
import 'package:task_buddy/shared/auth_form.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.authenticationBloc,
  });

  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
            const GlobalText(
              text: "Good to see you again 😅",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            // 10.heightBox,
            AuthForm(
              buttonTxt: 'Sign in',
              authenticationBloc: authenticationBloc,
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
    );
  }
}
