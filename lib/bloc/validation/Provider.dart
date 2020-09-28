import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';

class Provider extends InheritedWidget{

  final bloc=ValidationBloc();

  Provider({Key key,Widget child}) : super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;

    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  static ValidationBloc of(BuildContext context){
      return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }



}