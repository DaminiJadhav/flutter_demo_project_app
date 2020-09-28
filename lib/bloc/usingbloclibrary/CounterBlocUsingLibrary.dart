import 'package:bloc/bloc.dart';
import 'package:flutterdemoprojectapp/bloc/CounterEvent.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterEventBlocLibrary.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterState.dart';

class CounterBlocUsingLibrary  extends Bloc<CounterEventBlocLibrary,CounterState>{

  CounterBlocUsingLibrary():super(CounterState(counter: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEventBlocLibrary event) async*{
    if(event is IncreamentEvent){

       yield CounterState(counter:state.counter + 1);
    }else if(event is DecreamentEvent){
      yield CounterState(counter:state.counter - 1);

    }
  }
//  CounterBlocUsingLibrary(CounterState initialState) : super(initialState);

//  @override
//  CounterState get initialState => CounterState(counter: 0);





}