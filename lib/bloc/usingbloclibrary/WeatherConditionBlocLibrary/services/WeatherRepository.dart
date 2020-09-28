import 'package:flutter/cupertino.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/model/weather.dart';

import 'WeatherApiClient.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<WeatherConditionResponse> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}