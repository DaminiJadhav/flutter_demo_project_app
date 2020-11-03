import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterdemoprojectapp/colors/MyColors.dart';

import 'bloc/blocsupervisor/statemanagementfood/food_bloc_delegate.dart';

import 'package:bloc/bloc.dart';


import 'getlocation/GetCurrentLocation.dart';


void main() {

//  BlocSupervisor().delegate=simpleBloc();
  Bloc.observer = SimpleBlocObserver();

//  final WeatherRepository weatherRepository = WeatherRepository(
//    weatherApiClient: WeatherApiClient(
//      httpClient: http.Client(),
//    ),
//  );
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
//        home: WeatherConditionMain(weatherRepository: weatherRepository,),
        home:GetCurrentLocation(),
//      home: BlocProvider<HomePageBloc>(
//        create: (BuildContext context){
//          return HomePageBloc();
//        },
//          child:HomePage() ,
//    ),
//      home: JobPositionMainPage(),

//      home:CounterBlocUsingLibraryExample() ,
//      home: BlocProvider<CounterBlocUsingLibrary>(
//        create: (BuildContext context){
//          return CounterBlocUsingLibrary();
//        },
//        child:CounterBlocUsingLibraryExample() ,
//
//      ) ,
        theme: ThemeData(
            brightness: Brightness.light,
//          primaryColor: Colors.lightBlue,
            primaryColor: MyColors.myPrimaryColor,
//          primaryColor: MyColors.myColors[50],

            primaryColorDark: Colors.grey,
//        accentColor: Colors.deepPurpleAccent,
//          primarySwatch: Colors.red,
//        fontFamily: "IndieFlower"
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            )
//        primaryIconTheme: IconThemeData(color: Colors.grey)

        ),
      )

  );
}
