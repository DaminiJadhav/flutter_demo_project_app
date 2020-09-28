import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/validation/SuccessBlocValidation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutterdemoprojectapp/bloc/validation/Validator.dart';

class ValidationBloc extends  Validators implements BaseBloc{

//  final _emailController=StreamController<String>.broadcast();
//  final _passwordController=StreamController<String>.broadcast();

  final _emailController=BehaviorSubject<String>();
  final _passwordController=BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);


  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (e, p) => true);


//  Stream<bool> get submitCheck => Rx.combineLatest2(
//      email, password, (e, p) => e.isNotEmpty && p.isNotEmpty);


  submit(BuildContext context,int value) {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;





//    if(value==0){
//      if(validEmail==null){
//      _emailController.sink.addError('Field cannot be empty');
//      }else if(validPassword==null){
//        _passwordController.sink.addError('Field cannot be empty');
//      }
//    }else {
//      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SuccessBlocValidation()));
//
//    }


//    if(validEmail==null && validEmail==null){
//      _emailController.sink.addError('Field cannot be empty');
//    }else if(validPassword==null && validPassword==null){
//      _passwordController.sink.addError('Field cannot be empty');
//    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SuccessBlocValidation()));

//    }
//    if(!validEmail.isEmpty && !validPassword.isEmpty){
//      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SuccessBlocValidation()));
//
//    }

    print('Email is $validEmail, and password is $validPassword');
  }


  checkFieldEmptyOrNot(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    if(validEmail==null){
      _emailController.sink.addError('Field cannot be empty');
      }else if(validPassword==null){
        _passwordController.sink.addError('Field cannot be empty');
      }


  }

//  Stream<bool> get submitValid =>
//      Observable.combineLatest2(email, password, (e, p) => true);


  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();
    _passwordController?.close();
  }
}


abstract class BaseBloc{
  void dispose();
}