import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_buddy/models/signin_model.dart';

class AuthenticationRepo {
  Future<SignInModel> login(String email, String password) async {
    try {
      log('Login request sent', name: 'AuthenticationRepo');
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };
      final response = await http.post(
        Uri.parse('https://task-buddy-fe0i.onrender.com/admin/signin'),
        body: jsonEncode(body),
         headers: <String, String>{
          'Content-Type': 'application/json', // Specify the content type
        },
      );
      log('Login request completed', name: 'AuthenticationRepo');
      // final result = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      log('Login request completed,response: $jsonBody');

      return SignInModel.fromMap(jsonBody);
      // } else {
      // throw Exception('Failed to login');
      // }
    } catch (e) {
      throw Exception('Authentication Failed! Please try again.');
    }
  }
}
