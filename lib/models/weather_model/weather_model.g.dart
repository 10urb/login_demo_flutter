// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      dayName: json['DayName'] as String?,
      dayOfMonth: json['DayOfMonth'] as int?,
      degree: (json['Degree'] as num?)?.toDouble(),
      id: json['Id'] as int?,
      month: json['Month'] as String?,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Degree': instance.degree,
      'DayOfMonth': instance.dayOfMonth,
      'Month': instance.month,
      'DayName': instance.dayName,
    };
