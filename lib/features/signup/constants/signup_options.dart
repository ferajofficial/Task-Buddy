import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/const/resource.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupWithGoogle extends StatelessWidget {
  const SignupWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              thickness: 1,
              color: Colors.grey,
              // indent: 50,
              // endIndent: 50,
            ).w(120),
            15.widthBox,
            Text(
              "Sign up with",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            15.widthBox,
            const Divider(
              thickness: 1,
              color: Colors.grey,
              // indent: 50,
              // endIndent: 50,
            ).w(120),
          ],
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.grey,
                      )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      R.ASSETS_ICONS_GOOGLE_SVG,
                      height: 24,
                    ),
                    Text(
                      " Google",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )).w(250),
          ],
        ),
      ],
    );
  }
}
