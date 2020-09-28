import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/model/weather.dart';

abstract class WeatherConditionState extends Equatable {
  WeatherConditionState([List props = const []]) : super();
}

class WeatherEmpty extends WeatherConditionState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoading extends WeatherConditionState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoaded extends WeatherConditionState {
  final WeatherConditionResponse weather;

  WeatherLoaded({@required this.weather})
      : assert(weather != null),
        super([weather]);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherError extends WeatherConditionState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}