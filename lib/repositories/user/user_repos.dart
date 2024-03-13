import 'dart:async';


import 'package:task_buddy/repositories/user/user_repo.dart';




class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return _user;
  }
}
