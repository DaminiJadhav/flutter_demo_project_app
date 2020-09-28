import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/foodexportfile.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/model/food.dart';

import 'FoodFormMainPage.dart';
import 'food_list.dart';
import 'food_list_screen.dart';

class FoodFormHomePage extends StatefulWidget {
  @override
  _FoodFormHomePageState createState() => _FoodFormHomePageState();
}

class _FoodFormHomePageState extends State<FoodFormHomePage> {
  String _foodForm;

  @override
  Widget build(BuildContext context) {
     return BlocProvider<FoodBloc>(
      create: (BuildContext context){
        return FoodBloc();
      },
      child:FoodFormMainPage() ,

    );







//    return Scaffold(
//        appBar: AppBar(
//          title: Text('Food Form'),
//        ),
////        body:BlocBuilder<FoodBloc,List<Food>>(
//////          cubit: BlocProvider.of<FoodBloc>(context),
////          builder: (context,state){
////            return  Container(
////              child: Center(
////                child: Column(
////                  mainAxisAlignment: MainAxisAlignment.center,
////                  children: <Widget>[
////                    TextFormField(
////                      //          controller: passcontroller,
////                      decoration: InputDecoration(
////                        hintText: 'food',
////                      ),
////                      onChanged: (text){
////                        setState(() {
////                          _foodForm=text;
////                        });
////                      },
////                    )
////                  ],
////                ),
////              ),
////
////
////            );
////          },
////        ),
//        body: SingleChildScrollView(
//          child: Container(
//              child: Center(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    TextFormField(
//                      //          controller: passcontroller,
//                      decoration: InputDecoration(
//                        hintText: 'food',
//                      ),
//                      onChanged: (text){
//                        setState(() {
//                          _foodForm=text;
//                        });
//                      },
//                    ),
//                    FoodList(),
//                  ],
//                ),
//              ),
//
//
//            ),
//        ),
////          child:
//        floatingActionButton: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            FloatingActionButton(
//              child: Icon(Icons.save),
//              onPressed: (){
////                context.bloc<FoodBloc>().add(FoodEvent.add(Food(_foodForm)));
////                  BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(Food(_foodForm)));
//              },
//            ),
//            FloatingActionButton(
//              child: Icon(Icons.navigate_next),
//              onPressed: (){
////                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodListScreen()));
//              },
//            )
//          ],
//        ),
//
//    );
  }
}
