import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_buddy/const/env/env.dart';
import 'package:task_buddy/models/signin_model.dart';
import 'package:task_buddy/models/signup_model.dart';

class AuthenticationRepo {
  //  --> SignIn the User
  Future<SignInModel> signin(String email, String password) async {
    try {
      log('Login request sent', name: 'AuthenticationRepo');
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };
      final response = await http.post(
        Uri.parse('${Env.baseUrl}/admin/signin'),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      log('Login request completed', name: 'AuthenticationRepo');
      final jsonBody = jsonDecode(response.body);
      log('Login request completed,response: $jsonBody');
      return SignInModel.fromMap(jsonBody);
    } catch (e) {
      throw Exception('Authentication Failed! Please try again.');
    }
  }

  //  --> SignUp the User
  Future<SignUpModel> signup(
      String email, String password, String userName) async {
    try {
      log('Signup request sent', name: 'AuthenticationRepo');
      final Map<String, String> body = {
        'name': userName,
        'email': email,
        'password': password,
      };
      final response = await http.post(
        Uri.parse('${Env.baseUrl}/admin/signup'),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      log('Signup request completed', name: 'AuthenticationRepo');
      final jsonBody = jsonDecode(response.body);
      log('Signup request completed,response: $jsonBody');
      return SignUpModel.fromMap(jsonBody);
    } catch (e) {
      throw Exception('Authentication Failed! Please try again.');
    }
  }
}
