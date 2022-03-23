import 'package:json_annotation/json_annotation.dart';
import 'package:login_demo_flutter/core/i_base_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends IBaseModel<LoginModel> {
  LoginModel({this.email, this.password});

  String? email;
  String? password;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  LoginModel fromJson(Map<String, dynamic> json) => LoginModel.fromJson(json);
}
