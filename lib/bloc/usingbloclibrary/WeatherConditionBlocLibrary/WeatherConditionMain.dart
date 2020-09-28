
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/services/WeatherRepository.dart';

import 'WeatherConditionHome.dart';

class WeatherConditionMain extends StatelessWidget {
  final WeatherRepository weatherRepository;

  WeatherConditionMain({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: WeatherConditionHome(
        weatherRepository: weatherRepository,
      ),
    );
  }
}