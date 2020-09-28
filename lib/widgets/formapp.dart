

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ProductList.dart';

//void main() => runApp(formapp());

class formapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SingleChildScrollView(child: MyCustomForm()),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<MyCustomForm> {
 String selectedIndex;
  final formkey=GlobalKey<FormState>();
 bool viewforgetandresendotp=true;

 final _phoneno = TextEditingController();
 final _password = TextEditingController();

 Timer _timer;
 int _start=10;


 @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter full name',
              labelText: 'Name'
            ),
            validator: (value){
              if(value.isEmpty){
                return 'please enter name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneno,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            validator: (value) {
              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
              RegExp regExp = new RegExp(patttern);
              if (value.isEmpty) {
                return 'Please enter  phone number';
              }else if(!regExp.hasMatch(value)){
                return 'Please enter valid mobile number';
              }
              return null;
            },
            onChanged: (value){
              String mobileNumber = r'(^(?:[+0]9)?[0-9]{10,12}$)';
              Pattern emailAddress =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regexEmail= new RegExp(emailAddress);
              RegExp regexMobile = new RegExp(mobileNumber);
              if(regexMobile.hasMatch(_phoneno.text)){

                if(_phoneno.text.length==10){
                  setState(() {
                    viewforgetandresendotp=false;
                  });
                  StartTimer();
                }
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
            validator: (value) {

              if (value.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Enter a email',
              labelText: 'Email',
            ),
            validator: (value) {
              Pattern pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);
              if (value.isEmpty) {
                return 'Please enter  email number';
              }else if(!regex.hasMatch(value)){
                return 'Please enter valid email number';
              }
              return null;
            },
          ),

          new Container(
            padding: const EdgeInsets.all(15.0),
            child: new RaisedButton(
              child: Text('Submit'),
                onPressed:(){
                  if(formkey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Data is in processing'),
                    ));
                    showForgetandOtpText(true);

                    showAlertDialog(context);
                  }
                }),
          ),

           Container(
             alignment: Alignment.centerRight,
             child: viewforgetandresendotp ? Text('Forget password') : _start==0
                 ? GestureDetector(
                 onTap: (){
                   _start=10;

                   StartTimer();
                 },
                 child: Text('Resend'))
                 :Text('$_start'),
           )

//            DropdownButtonFormField(
//              hint: Text('Select item'),
//              value: selectedIndex,
//              onChanged: (pos){
//                setState(() {
//                  selectedIndex=pos;
//                });
//              },
//              items: ["C","C++","PHP","Java","Android","Flutter"].map((label) =>
//                    DropdownMenuItem(
//                      value: label,
//                      child: Text(label),
//                    )
//              ).toList(),
//            )


        ],
      ),
    );
  }

 void StartTimer(){
   showForgetandOtpText(false);

   const onesec=const Duration(seconds: 3);
   _timer=new Timer.periodic(
       onesec,
           (timer) {
         setState(() {
           if(_start<1){
             timer.cancel();
           }else{
             _start=_start-1;
           }
         });
       });

 }

 void showForgetandOtpText(bool isShow){
   setState(() {
     this.viewforgetandresendotp=isShow;
   });
 }


 String validateMobile(String value) {
   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
   RegExp regExp = new RegExp(patttern);
   if (value.length == 0) {
     return 'Please enter mobile number';
   }
   else if (!regExp.hasMatch(value)) {
     return 'Please enter valid mobile number';
   }
   return null;
 }
 showAlertDialog(BuildContext context){

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog dialog=AlertDialog(
      title: Text('Simple Alert '),
      content: Text('This is an alert message.'),
//      actions:[okButton],

      actions: <Widget>[
        FlatButton(
          child: Text('ok'),
          onPressed: (){
//            Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProductList()));
//          SystemNavigator.pop();
          },
        )
      ],

    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return dialog;
      },
    );

  }
}

