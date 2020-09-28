import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/food_list.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/foodbloc/food_bloc.dart';

import 'food_list_screen.dart';
import 'foodbloc/food_event.dart';
import 'model/food.dart';

class FoodFormMainPage extends StatefulWidget {
  @override
  _FoodFormMainPageState createState() => _FoodFormMainPageState();
}

class _FoodFormMainPageState extends State<FoodFormMainPage> {
  String _foodForm;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Food Form'),
      ),
      body: BlocBuilder(
        cubit: BlocProvider.of<FoodBloc>(context),
        builder: (BuildContext context,state){
          return  Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    //          controller: passcontroller,
                    decoration: InputDecoration(
                      hintText: 'food',
                    ),
                    onChanged: (text){
                      setState(() {
                        _foodForm=text;
                      });
                    },
                  ),
                  FoodList(),
                ],
              ),
            ),


          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            child: Icon(Icons.save),
            onPressed: (){
                  BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(Food(_foodForm)));
            },
          ),
          FloatingActionButton(
            heroTag: 'button',

            child: Icon(Icons.navigate_next),
            onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodListScreen()));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return BlocProvider(
                      create: (context) => FoodBloc(),
                      child: FoodList(),
                    );
                  }));
            },
          )
        ],
      ),
    );

  }
}
