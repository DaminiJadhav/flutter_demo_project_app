import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/weatherbloc/WeatherBloc.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final weatherBloc=WeatherBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherBloc.getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Data'),
      ),
      body: Container(
        child: StreamBuilder<WeatherResponse>(
          stream: weatherBloc.weatherData.stream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return _buildWeatherWidget(snapshot.data);
            }else if(snapshot.hasError){
              return _buildErrorWidget(snapshot.error);
            }else{
              return _buildLoadingWidget();
            }
          }
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildWeatherWidget(WeatherResponse data) {
//    WeatherResponse user=data.name.;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.name),
            Text(data.id.toString(), style: Theme.of(context).textTheme.subtitle),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(data.base, style: Theme.of(context).textTheme.body1),
          ],
        ));
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
  }

}
