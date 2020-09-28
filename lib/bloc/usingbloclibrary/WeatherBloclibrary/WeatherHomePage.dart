import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/WeatherApiProvider.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/weatherbloc/WeatherBloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_bloc.dart';

import 'WeatherMainPage.dart';

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc library'),
      ),
      body:BlocProvider(
        create: (context) => WeatherBloc1(WeatherApiProvider()),
        child: WeatherMainPage(),
      ),
    );
  }
}
