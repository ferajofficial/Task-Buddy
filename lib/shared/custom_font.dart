import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? secondaryColor;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final double fontSize;
  final TextAlign textAlign;
  final bool isStrikeThrough;
  final double? decorationThickness;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final bool isSecondaryFont;
  final int? maxlines;
  final TextOverflow overflow;

  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.secondaryColor,
    this.fontWeight = FontWeight.w500,
    this.letterSpacing = 0.3,
    this.textAlign = TextAlign.center,
    this.fontSize = 12,
    this.decorationThickness = 0.5,
    this.isStrikeThrough = false,
    this.decorationColor,
    this.decorationStyle,
    this.overflow = TextOverflow.clip,
    this.isSecondaryFont = false,
    this.maxlines, this.decoration,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style:
          // isSecondaryFont
          //     ? GoogleFonts.quicksand(
          //         fontWeight: FontWeight.w600,
          //         fontSize: fontSize,
          //         color: secondaryColor,
          //       )
          //     :
          GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: 1.3,
        decoration: isStrikeThrough ? TextDecoration.lineThrough : decoration,
        decorationThickness: decorationThickness,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxlines,
    );
  }
}
