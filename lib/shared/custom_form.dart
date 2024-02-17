import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    // Add any additional parameters you need here
    this.additionalTextField = false,
    this.additionalTextFieldName,
    this.additionalTextFieldValidator,
    this.additionalTextFieldDecoration,
  }) : super(key: key);

  final bool additionalTextField;
  final String? additionalTextFieldName;
  final FormFieldValidator? additionalTextFieldValidator;
  final InputDecoration? additionalTextFieldDecoration;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          if (widget
              .additionalTextField) // Check if additionalTextField is true
            FormBuilderTextField(
              name: widget.additionalTextFieldName ?? '',
              decoration: widget.additionalTextFieldDecoration ??
                  const InputDecoration(),
              validator: widget.additionalTextFieldValidator,
            ),
          20.heightBox,
          FormBuilderTextField(
            name: "email",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Colors.grey,
              ),
              labelText: "Email",
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              hintText: "Enter your email",
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
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          20.heightBox,

          FormBuilderTextField(
            name: "password",
            textInputAction: TextInputAction.done,
            obscureText: _obscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.fingerprint_outlined),
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              labelText: "Password",
              labelStyle: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              hintText: "Enter your password",
              hintStyle: GoogleFonts.poppins(
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
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(11),
            ]),
          ),

          // 5.heightBox,
        ],
      ),
    );
  }
}
