import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:task_buddy/features/signin/constants/signin_options.dart';
import 'package:task_buddy/shared/custom_form.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SigninView();
  }
}

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(R.ASSETS_ILLUSTRATIONS_SIGNIN_SVG,
                  height: 220),
            ),
            30.heightBox,
            Text(
              "Welcome Back!!",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            // 5.heightBox,
            Text(
              "Good to see you again 😅",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            20.heightBox,
            const CustomForm(),
            30.heightBox,
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // context.router.push(const SignupRoute());
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
                )),
              ),
            ),
            25.heightBox,
            const SigninOptions(),
          ],
        ).p12(),
      ),
    );
  }
}
