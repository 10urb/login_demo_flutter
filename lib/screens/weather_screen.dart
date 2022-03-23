import 'package:flutter/material.dart';
import 'package:login_demo_flutter/business/weather_manager.dart';
import 'package:login_demo_flutter/constants/strings/title_strings.dart';
import 'package:login_demo_flutter/models/weather_model/weather_model.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.WEATHER_STATE),
      ),
      body: _body(context),
    );
  }



  ListView _body(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 80,
          horizontal: MediaQuery.of(context).size.width / 50),
      itemCount: context.watch<WeatherManager>().weathers.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var weather = context.read<WeatherManager>().weathers[index];
        return _listItem(weather);
      },
    );
  }

  

  ListTile _listItem(WeatherModel weather) {
    return ListTile(
          leading: Icon(
            Icons.power_input_rounded,
            color: weather.degree! < 15 ? Colors.blue : Colors.orange,
          ),
          title: Text('Degree: ${weather.degree}'),
          subtitle: Text(
              'Date: ${weather.dayOfMonth}/${weather.month} ${weather.dayName}'),
        );
  }
}
