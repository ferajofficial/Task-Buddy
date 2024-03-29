import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonTxt,
    this.onPressed,
  });
  final double width;
  final double height;
  final String buttonTxt;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonTxt,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
