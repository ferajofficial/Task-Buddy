// import 'dart:async';

// enum AuthenticationStatus { unknown, authenticated, unauthenticated }

// class AuthenticationRepository {
//   final _controller = StreamController<AuthenticationStatus>();

//   Stream<AuthenticationStatus> get status async* {
//     await Future<void>.delayed(const Duration(seconds: 1));
//     yield AuthenticationStatus.unauthenticated;
//     yield* _controller.stream;
//   }

//   Future<void> logIn({
//     required String email,
//     required String password,
//   }) async {
//     await Future.delayed(
//       const Duration(milliseconds: 300),
//       () => _controller.add(AuthenticationStatus.authenticated),
//     );
//   }

//   void logOut() {
//     _controller.add(AuthenticationStatus.unauthenticated);
//   }

//   void dispose() => _controller.close();
// }

// import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_buddy/models/signin_model.dart';

class AuthenticationRepo {
  Future<Map<String, dynamic>> login(String email, String password) async {
    print('Api method in');
    try {
      final response = await http.post(
        Uri.parse('https://task-buddy-fe0i.onrender.com/admin/login'),

        // body: jsonEncode(<String, String>{
        //   'email': email,
        //   'password': password,
        // }),
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
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Authentication Failed! Please try again.');
    }
  }
}
