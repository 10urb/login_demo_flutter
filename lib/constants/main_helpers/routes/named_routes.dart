import 'package:flutter/material.dart';
import 'package:login_demo_flutter/constants/main_helpers/routes/route_strings.dart';
import 'package:login_demo_flutter/screens/auth_screens/login_screen.dart';
import 'package:login_demo_flutter/screens/auth_screens/register_screen.dart';
import 'package:login_demo_flutter/screens/weather_screen.dart';

class NamedRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      RouteStrings.LOGIN: (BuildContext context) => LoginScreen(),
      RouteStrings.REGISTER: (BuildContext context) =>const  RegisterScreen(),
      RouteStrings.WEATHER: (BuildContext context) => const WeatherScreen(),
    };
  }
}
