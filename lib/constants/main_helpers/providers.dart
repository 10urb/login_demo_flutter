import 'package:login_demo_flutter/business/auth_manager.dart';
import 'package:login_demo_flutter/business/weather_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => AuthManager()),
      ChangeNotifierProvider(create: (_) => WeatherManager()),
    ];
  }
}
