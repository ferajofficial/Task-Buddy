import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskFields extends StatelessWidget {
  const TaskFields({
    super.key,
    required this.labelTask,
    required this.hintText,
    this.prefixicon,
    this.maxLength,
    this.maxLines,
    this.onPressed,
    this.suffixicon,
    this.dateController,
    required this.name,
    this.enabled,
  });
  final String labelTask;
  final String hintText;
  final IconData? prefixicon;
  final int? maxLength;
  final int? maxLines;
  final VoidCallback? onPressed;
  final IconData? suffixicon;
  final TextEditingController? dateController;
  final String name;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      enabled: enabled ?? true,
      controller: dateController,
      name: name,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixicon != null
            ? Icon(
                prefixicon,
                color: Colors.grey,
              )
            : null,
        suffixIcon: suffixicon != null
            ? Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: onPressed, icon: Icon(suffixicon)))
                .h(50)
                .w(50)
                .pOnly(right: 10)
            : null,
        labelText: labelTask,
        labelStyle: TextStyle(
          fontStyle: GoogleFonts.poppins().fontStyle,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontStyle: GoogleFonts.poppins().fontStyle,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
