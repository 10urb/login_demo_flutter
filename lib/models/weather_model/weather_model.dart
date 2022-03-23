import 'package:json_annotation/json_annotation.dart';
import 'package:login_demo_flutter/core/i_base_model.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends IBaseModel<WeatherModel> {
  WeatherModel({
    this.dayName,
    this.dayOfMonth,
    this.degree,
    this.id,
    this.month,
  });

  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'Degree')
  double? degree;
  @JsonKey(name: 'DayOfMonth')
  int? dayOfMonth;
  @JsonKey(name: 'Month')
  String? month;
  @JsonKey(name: 'DayName')
  String? dayName;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  WeatherModel fromJson(Map<String, dynamic> json) =>
      WeatherModel.fromJson(json);
}
