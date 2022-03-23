import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_demo_flutter/core/base_service.dart';
import 'package:login_demo_flutter/helper/environment.dart';
import 'package:login_demo_flutter/models/weather_model/weather_model.dart';

class WeatherService extends BaseService<WeatherService> {
  static final WeatherService _singleton = WeatherService._internal();
  factory WeatherService() => _singleton;
  WeatherService._internal();

  Future<List<WeatherModel>> getWeathers() async {
    http.Response response = await http.get(
        Uri.parse(Environment.baseUri + 'WeatherForecast/GetWeatherForecasts'),
        headers: Environment.apiHeader);
    List<dynamic> model = jsonDecode(response.body);
    List<WeatherModel> models = [];
    for (var item in model) {
      models.add(WeatherModel.fromJson(item));
    }

    return models;
  }
}
