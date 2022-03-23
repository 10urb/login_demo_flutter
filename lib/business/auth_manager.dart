// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:login_demo_flutter/models/login_model/login_model.dart';
import 'package:login_demo_flutter/models/login_response_model/login_response_model.dart';
import 'package:login_demo_flutter/models/register_model/register_model.dart';
import 'package:login_demo_flutter/service/auth_service.dart';

class AuthManager extends ChangeNotifier {
  final AuthService _service = AuthService();

  late String _email;
  set setEmail(String value) => _email = value;

  late String _password;
  set setPassword(String value) => _password = value;

  Future<LoginResponseModel?> login() async {
    var response =
        await _service.login(LoginModel(email: _email, password: _password));
        
    return response;
  }

  Future<bool> register(RegisterModel register) async {
    register.email = _email;
    register.password = _password;
    register.id = 0;
    var response = await _service.register(register);
    return response;
  }
}
