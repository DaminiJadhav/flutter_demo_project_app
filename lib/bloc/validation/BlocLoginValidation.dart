import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/validation/Provider.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';

import 'SuccessBlocValidation.dart';

class BlocLoginValidation extends StatefulWidget {
  @override
  _BlocLoginValidationState createState() => _BlocLoginValidationState();
}

class _BlocLoginValidationState extends State<BlocLoginValidation> {
  final blocvalidation=ValidationBloc();
  TextEditingController _emaiController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  SuccessValidation(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SuccessBlocValidation()));
  }
  @override
  Widget build(BuildContext context) {
//    final blocvalidation=Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login validation using Bloc'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: blocvalidation.email,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _emaiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter email',
                      labelText: 'email',
                      errorText: snapshot.error
                    ),
                    onChanged: blocvalidation.changeEmail,
                  );
                }
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                stream: blocvalidation.password,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passController,

                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter password',
                        labelText: 'password',
                        errorText: snapshot.error

                    ),
                    onChanged: blocvalidation.changePassword,

                  );
                }
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<bool>(
                stream: blocvalidation.submitCheck,
                builder: (context, snapshot) {
                  return RaisedButton(
//                    onPressed: (){
//                      if(snapshot.hasData){
//                        blocvalidation.submit(context);
//                      }else{
//                        blocvalidation.submit(context);
//                      }
//                    },

                    onPressed: (!snapshot.hasData || !snapshot.data)
                        ?  blocvalidation.checkFieldEmptyOrNot()

                      : () {
                      blocvalidation.submit(context,1);
                      _emaiController.text = '';
                      _passController.text = '';
                    },
                    child: Text('Submit!'),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }



}
