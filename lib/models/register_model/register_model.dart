import 'package:json_annotation/json_annotation.dart';
import 'package:login_demo_flutter/core/i_base_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends IBaseModel<RegisterModel> {
  RegisterModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.salary,
    this.gender,
    this.birthDate,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  double? salary;
  bool? gender;
  int? birthDate;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  @override
  RegisterModel fromJson(Map<String, dynamic> json) =>
      RegisterModel.fromJson(json);
}
