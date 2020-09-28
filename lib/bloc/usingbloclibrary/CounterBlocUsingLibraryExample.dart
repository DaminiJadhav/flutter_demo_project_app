import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/CounterBloc.dart';
import 'package:flutterdemoprojectapp/bloc/CounterEvent.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterBlocUsingLibrary.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterEventBlocLibrary.dart';

import 'bloclibrary/counter_bloc.dart';

class CounterBlocUsingLibraryExample extends StatefulWidget {
  @override
  _BlocCounterExampleState createState() => _BlocCounterExampleState();
}

class _BlocCounterExampleState extends State<CounterBlocUsingLibraryExample> {
//  final _bloc=CounterBloc();

  @override
  Widget build(BuildContext context) {
//    final _counterbloc=BlocProvider.of<CounterBloc1>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc counter example  '),
      ),
      body:
        BlocBuilder(
          cubit: BlocProvider.of<CounterBlocUsingLibrary>(context),
          builder: (BuildContext context ,state){
           return Container(
              alignment: Alignment.center,
             child: Text(state.counter.toString()),

//            child: Text('you have pushed button this many time \n }'),
            );
          },


        ),
//      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
//              _counterbloc.add(CounterEvent1.increament);
              BlocProvider.of<CounterBlocUsingLibrary>(context).add(IncreamentEvent());
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: ()  {
//              _counterbloc.add(CounterEvent1.decreament);
            BlocProvider.of<CounterBlocUsingLibrary>(context).add(DecreamentEvent());

          },

          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    _bloc.dispose();
  }
}
