import 'package:flutter/material.dart';
import 'package:login_demo_flutter/models/weather_model/weather_model.dart';
import 'package:login_demo_flutter/service/weather_service.dart';

class WeatherManager extends ChangeNotifier {
  WeatherService _service = WeatherService();
  List<WeatherModel> weathers = [];

  Future<void> getWeathers() async {
    var response = await _service.getWeathers();
    weathers.addAll(response);
    notifyListeners();
  }
}
