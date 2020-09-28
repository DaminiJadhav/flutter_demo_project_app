import 'package:equatable/equatable.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WeatherIsNotSearched extends WeatherState{

}
class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final  weather;
  WeatherIsLoaded(this.weather);

  Main get getWeather => weather;

  @override
  // TODO: implement props
  List<Object> get props => [weather];

}

class WeatherIsNotLoaded extends WeatherState{

}