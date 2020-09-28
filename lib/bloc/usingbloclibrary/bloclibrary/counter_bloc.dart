import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';


enum CounterEvent1{increament,decreament}

class CounterBloc1 extends Bloc<CounterEvent1, int> {
  CounterBloc1() : super(0);

  @override
  int get initialState => 0;


  @override
  Stream<int> mapEventToState(
    CounterEvent1 event,
  ) async* {
    // TODO: implement mapEventToState
    switch(event){
      case CounterEvent1.increament:
        yield state+1;
        break;
      case CounterEvent1.decreament:
        yield state-1;
    }
  }
}
