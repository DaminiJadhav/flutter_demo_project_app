import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/WeatherApiProvider.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc implements BaseBloc{
  WeatherApiProvider weatherApiProvider=WeatherApiProvider();
  final weatherController=BehaviorSubject<WeatherResponse>();

  getWeatherData() async{
    WeatherResponse response=await weatherApiProvider.getWeather();
    weatherController.sink.add(response);

  }
  BehaviorSubject<WeatherResponse> get weatherData => weatherController;

  @override
  void dispose() {
    // TODO: implement dispose
    weatherController.close();
  }
}