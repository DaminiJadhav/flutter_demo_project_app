import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/WeatherApiProvider.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_event.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_state.dart';


class WeatherBloc1 extends Bloc<WeatherEvent,WeatherState>{
  WeatherApiProvider weatherApiProvider;
  WeatherBloc1(this.weatherApiProvider) : super(WeatherIsNotSearched());

  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

      if(event is FetchWeather){
        yield WeatherIsLoading();

        try{
          Main mainweather=await weatherApiProvider.getWeathercity(event.city);
          yield WeatherIsLoaded(mainweather);
        }catch(e){
          yield WeatherIsNotLoaded();
        }
      }else if(event is ResetWeather){
        yield WeatherIsNotSearched();
      }

  }

}