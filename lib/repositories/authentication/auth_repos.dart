import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:task_buddy/models/signin_model.dart';

class AuthenticationRepo {
  Future<Map<String, SignInModel>> login(String email, String password) async {
    print('Api method in');
    try {
      final response = await http.post(
        Uri.parse('https://task-buddy-fe0i.onrender.com/admin/login'),
      );
      print('Api Hitting');
      if (response.statusCode == 200) {
        print('Api response : ${response.body}');
        final body = jsonDecode(response.body);
        return body.map((e) {
          print('Api response signin model in');
          return SignInModel(
            status: e['status'] as bool,
            message: e['message'] as String,
            id: e['id'] as String,
          );
        });
      }
      // print(object)
      else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Authentication Failed! Please try again.');
    }
  }
}
