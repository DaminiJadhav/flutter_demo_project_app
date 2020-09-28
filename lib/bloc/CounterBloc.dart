import 'dart:async';

import 'package:flutterdemoprojectapp/bloc/CounterEvent.dart';

class CounterBloc{
  int _counter=0;

  final _counterStateController =StreamController<int>();
  StreamSink<int> get  _incounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController=StreamController<CounterEvent>();
  Sink<CounterEvent> get  counterEventSink => _counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }


  void _mapEventToState(CounterEvent event){
    if(event is IncreamentCounter)
      _counter++;
    else
      _counter--;

    _incounter.add(_counter);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }

}