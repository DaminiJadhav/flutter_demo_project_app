import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/bloc/weather_condition_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/bloc/weather_condition_event.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherConditionBlocLibrary/services/WeatherRepository.dart';

import 'CombinedWeatherTemperature.dart';
import 'LastUpdated.dart';
import 'Location.dart';
import 'bloc/weather_condition_state.dart';
import 'city_selection.dart';

class WeatherConditionHome extends StatefulWidget {
  final WeatherRepository weatherRepository;

  WeatherConditionHome({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  State<WeatherConditionHome> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherConditionHome> {
  WeatherConditionBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherConditionBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                _weatherBloc.add(FetchWeatherCondition(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherConditionBloc,WeatherConditionState>(
          cubit: _weatherBloc,
          builder: (_, WeatherConditionState state) {
            if (state is WeatherEmpty) {
              return Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location(location: weather.location),
                    ),
                  ),
                  Center(
                    child: LastUpdated(dateTime: weather.lastUpdated),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CombinedWeatherTemperature(
                        weather: weather,
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is WeatherError) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }
}
