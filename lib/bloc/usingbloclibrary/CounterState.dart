
import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
     int counter;
     CounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];
}

//class CounterInitial extends CounterState{
//  @override
//  // TODO: implement props
//  List<Object> get props => throw UnimplementedError();
//
//}