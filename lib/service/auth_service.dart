import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_demo_flutter/core/base_service.dart';
import 'package:login_demo_flutter/helper/environment.dart';
import 'package:login_demo_flutter/models/login_model/login_model.dart';
import 'package:login_demo_flutter/models/login_response_model/login_response_model.dart';
import 'package:login_demo_flutter/models/register_model/register_model.dart';

class AuthService extends BaseService<AuthService> {
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() => _singleton;
  AuthService._internal();

  Future<LoginResponseModel> login(LoginModel login) async {
    http.Response response = await http.post(
        Uri.parse(Environment.baseUri + 'User/Login'),
        headers: Environment.apiHeaderWithoutToken,
        body: jsonEncode(login.toJson()));
   LoginResponseModel model=LoginResponseModel.fromJson( jsonDecode(response.body));
    return model;
  }

  Future<bool> register(RegisterModel register) async {
    bool response =
        await BaseService.post(path: 'User/Register', model: register);
    return response;
  }
}
