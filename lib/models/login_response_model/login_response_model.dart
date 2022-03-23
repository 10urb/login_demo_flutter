import 'package:json_annotation/json_annotation.dart';
import 'package:login_demo_flutter/core/i_base_model.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends IBaseModel<LoginResponseModel> {
  LoginResponseModel({this.accessToken, this.expiration});
  String? accessToken;
  String? expiration;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);
}
