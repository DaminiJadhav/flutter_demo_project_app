import 'dart:convert';

import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';
import 'package:http/http.dart' as http;

class WeatherApiProvider {
//  Client weatherCllient=new Client();
  final baseUrl = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";


  Future<WeatherResponse> getWeather() async {
    try {
      final response = await http.get(
          baseUrl);
      return WeatherResponse.fromJson(json.decode(response.body));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
//      return WeatherResponse.withError("$error");
    }
  }

  //using bloc library
  Future<Main> getWeathercity(String city) async {
    final baseUrl1 = "https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=b6907d289e10d714a6e88b30761fae22";


      final result = await http.get(
          baseUrl1);
      print(result.body);
      if (result.statusCode != 200)
        throw Exception();
      return parseJson(result.body);
    }

    Main parseJson(final response){
      final jsonDecode=json.decode(response);

      final jsonWeather=jsonDecode["main"];
      return Main.fromJson(jsonWeather);
    }




}