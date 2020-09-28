
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherConditionEvent extends Equatable {
  WeatherConditionEvent([List props = const []]) : super();
}

class FetchWeatherCondition extends WeatherConditionEvent {
  final String city;

  FetchWeatherCondition({@required this.city})
      : assert(city != null),
        super();

  @override
  // TODO: implement props
  List<Object> get props => [city];
}