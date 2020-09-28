import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_event.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/bloc/weather_condition_event.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/bloc/weather_condition_state.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/model/weather.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/services/WeatherRepository.dart';

class WeatherConditionBloc extends Bloc<WeatherConditionEvent, WeatherConditionState> {
  final WeatherRepository weatherRepository;

  WeatherConditionBloc({@required this.weatherRepository})
      : assert(weatherRepository != null), super(null);

  @override
  Stream<WeatherConditionState> mapEventToState(WeatherConditionEvent event) async* {
    if (event is FetchWeatherCondition) {
      yield WeatherLoading();
      try {
        final WeatherConditionResponse weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }

//  @override
//  WeatherConditionState get initialState => WeatherEmpty();

//  @override
//  Stream<WeatherConditionState> mapEventToState(
//      WeatherConditionState currentState,
//      WeatherConditionEvent event,
//      ) async* {
//    if (event is FetchWeatherCondition) {
//      yield WeatherLoading();
//      try {
//        final WeatherConditionResponse weather = await weatherRepository.getWeather(event.city);
//        yield WeatherLoaded(weather: weather);
//      } catch (_) {
//        yield WeatherError();
//      }
//    }
//  }
}