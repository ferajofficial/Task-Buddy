import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/shared/custom_button.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    // Add any additional parameters you need here
    this.additionalTextField = false,
    this.additionalTextFieldName,
    this.additionalTextFieldValidator,
    this.additionalTextFieldDecoration,
    required this.buttonTxt,
    // required this.buttonTxt, required this.onPressed,
  }) : super(key: key);

  final bool additionalTextField;
  final String? additionalTextFieldName;
  final FormFieldValidator? additionalTextFieldValidator;
  final InputDecoration? additionalTextFieldDecoration;
  final String buttonTxt;
  // final VoidCallback onPressed;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //BloC
  AuthenticationBloc? authenticationBloc;
  @override
  void initState() {
    // authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
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
              textInputAction: TextInputAction.next,
              name: widget.additionalTextFieldName ?? '',
              decoration: widget.additionalTextFieldDecoration ??
                  const InputDecoration(),
              validator: widget.additionalTextFieldValidator,
            ),
          20.heightBox,
          FormBuilderTextField(
            controller: email,
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
            controller: password,
            name: "password",
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
              FormBuilderValidators.minLength(11),
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
                  fontWeight: FontWeight.w400,
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
                if (widget.buttonTxt == 'Sign in') {
                  authenticationBloc!.add(OnButtonPressEvent(
                    email: email.text,
                    password: password.text,
                  ));
                  print('button pressed');
                  // context.navigateTo(const HomeRoute());
                } else if (widget.buttonTxt == 'Sign up') {
                  // context.navigateTo(const HomeRoute());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
