import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/bloc/login_form_bloc.dart';

import 'LoginFormMainPage.dart';

class LoginFormHomePage extends StatefulWidget {
  @override
  _LoginFormHomePageState createState() => _LoginFormHomePageState();
}

class _LoginFormHomePageState extends State<LoginFormHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: BlocProvider(
          create: (context) => LoginFormBloc(),
          child: LoginFormMainPage()
      ),
    );
  }
}


