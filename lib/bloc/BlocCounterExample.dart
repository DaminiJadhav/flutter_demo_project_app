import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/CounterBloc.dart';
import 'package:flutterdemoprojectapp/bloc/CounterEvent.dart';

class BlocCounterExample extends StatefulWidget {
  @override
  _BlocCounterExampleState createState() => _BlocCounterExampleState();
}

class _BlocCounterExampleState extends State<BlocCounterExample> {
 final _bloc=CounterBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc counter example  '),
      ),
      body: StreamBuilder(
        stream: _bloc.counter,
        initialData: 0,
        builder: (context, snapshot) {
          return Container(
            alignment: Alignment.center,
            child: Text('you have pushed button this many time \n ${snapshot.data}'),
          );
        }
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _bloc.counterEventSink.add(IncreamentCounter()),
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => _bloc.counterEventSink.add(DecrementCounter()),

          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
