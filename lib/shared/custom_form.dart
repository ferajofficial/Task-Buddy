import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/features/signup/const/signup_keys.dart';
import 'package:task_buddy/shared/custom_button.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    // Add any additional parameters you need here
    this.isAdditionalTextField = false,
    this.additionalTextFieldName,
    this.additionalTextFieldValidator,
    this.additionalTextFieldDecoration,
    required this.buttonTxt, required this.authenticationBloc,
    // required this.buttonTxt, required this.onPressed,
  }) : super(key: key);

  final bool isAdditionalTextField;
  final String? additionalTextFieldName;
  final FormFieldValidator? additionalTextFieldValidator;
  final InputDecoration? additionalTextFieldDecoration;
  final String buttonTxt;
  final AuthenticationBloc authenticationBloc;
  // final VoidCallback onPressed;

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
          if (widget.isAdditionalTextField)
            FormBuilderTextField(
              textInputAction: TextInputAction.next,
              name: SignUpFormKeys.name,
              decoration: widget.additionalTextFieldDecoration ??
                  const InputDecoration(),
              validator: widget.additionalTextFieldValidator,
            ),
          20.heightBox,
          FormBuilderTextField(
            name: SignUpFormKeys.email,
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
            name: SignUpFormKeys.password,
            textInputAction: TextInputAction.next,
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
              FormBuilderValidators.minLength(5),
            ]),
          ),
          5.heightBox,
          if (widget.buttonTxt == 'Sign in')
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // context.navigateTo(
                  //   const ForgotPasswordRoute()
                  //   );
                },
                child: const CustomText(
                  text: "Forgot Password?",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          20.heightBox,
          CustomButton(
            width: double.infinity,
            height: 50,
            buttonTxt: widget.buttonTxt,
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                final fields = _formKey.currentState!.fields;
                final email = fields[SignUpFormKeys.email]!.value as String;
                final password =
                    fields[SignUpFormKeys.password]!.value as String;

                if (widget.buttonTxt == 'Sign in') {
                  widget.authenticationBloc.add(
                    OnSignInEvent(
                      email: email,
                      password: password,
                    ),
                  );
                  log('Sign in button pressed');
                } else if (widget.buttonTxt == 'Sign up') {
                  final userName = fields[SignUpFormKeys.name]!.value as String;
                  log(userName);
                 widget. authenticationBloc.add(
                    OnSignUpEvent(
                      userName: userName,
                      email: email,
                      password: password,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
