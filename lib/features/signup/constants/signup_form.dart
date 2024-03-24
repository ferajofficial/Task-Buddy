import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/features/signup/constants/signup_options.dart';
import 'package:task_buddy/shared/auth_form.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
              child: SvgPicture.asset(R.ASSETS_ILLUSTRATIONS_SIGNUP_SVG,
                  height: 200),
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
            AuthForm(
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
            20.heightBox,
            GestureDetector(
              onTap: () {
                context.maybePop();
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
    );
  }
}
