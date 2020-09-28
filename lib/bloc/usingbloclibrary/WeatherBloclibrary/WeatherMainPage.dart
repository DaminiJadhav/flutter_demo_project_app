import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/Model/WeatherResponse.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_event.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/WeatherBloclibrary/weatherbloc/weather_state.dart';

class WeatherMainPage extends StatefulWidget {
  @override
  _WeatherMainPageState createState() => _WeatherMainPageState();
}

class _WeatherMainPageState extends State<WeatherMainPage> {
  double _searchElevation = 1;
  TextEditingController _cityController;

  @override
  void initState() {
    _cityController = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherbloc=BlocProvider.of<WeatherBloc1>(context);

    return Column(
      children: <Widget>[
        BlocBuilder(
          cubit: BlocProvider.of<WeatherBloc1>(context),
          builder: (context,state){
            if(state is WeatherIsNotSearched){
              return SearchWeather(weatherbloc);
            }else if(state is WeatherIsLoading) {
                 return Center(child: CircularProgressIndicator(),);
            }else if(state is WeatherIsLoaded) {
              return ShowWeather(state.getWeather,_cityController.text);
            }
            return Text("Error");
          },
        )

      ],
    );
  }

  Widget SearchWeather(WeatherBloc1 bloc1){
    return Container(
      child: Column(
        children: <Widget>[
          Text('Search weather'),
          Text('instanly'),
          SizedBox(height: 24,),
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 800),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 60,
            margin: EdgeInsets.only(top: 36, left: 12, right: 12),
            padding: EdgeInsets.only(top: 4, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: _searchElevation
                  )
                ]
            ),
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none
              ),
              onSubmitted: (query) {
                var position = _cityController.text;
                print(position);
//              BlocProvider.of<JobPositionBloc>(context).add(JobPositionEventSearch(jobPosition: position));

//                   _jobPositionBloc.dispatch(
//                       JobPositionEventSearch(jobPosition: position));
              },
//              onChanged: (value){
//                bloc1.add(FetchWeather(_cityController.text));
//              },
            ),
          ),
          RaisedButton(
            child: Text("Search"),
            onPressed: (){
              print(_cityController.text);
                bloc1.add(FetchWeather(_cityController.text));
            },
          )
        ],
      ),
    );
  }
}


class ShowWeather extends StatelessWidget {
  Main _main;
  final  city;

  ShowWeather(this._main,this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(city),
          SizedBox(height: 10,),
          Text(_main.temp.round().toString()+"C"),
          Text("Temperature"),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(_main.temp_min.round().toString()+"C"),
                  Text("Min Temp"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(_main.pressure.round().toString()+"C"),
                  Text("Max Temp"),
                ],
              )

            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
