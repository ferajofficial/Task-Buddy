import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/features/signup/constants/signup_options.dart';
import 'package:task_buddy/shared/custom_button.dart';
import 'package:task_buddy/shared/custom_form.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(R.ASSETS_ILLUSTRATIONS_SIGNUP_SVG, height: 220),
            30.heightBox,
            Text(
              "Create an account",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            // 5.heightBox,
            Text(
              "We're keen to have you on board 😊",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            20.heightBox,
             CustomForm(),
            10.heightBox,
            const CustomButton(
                width: double.infinity, height: 50, buttonTxt: 'Sign up'),
            20.heightBox,
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // context.router.pop();`
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
              ),
            ),
            20.heightBox,

            const SignupOptions()
          ],
        ).p12(),
      ),
    );
  }
}
