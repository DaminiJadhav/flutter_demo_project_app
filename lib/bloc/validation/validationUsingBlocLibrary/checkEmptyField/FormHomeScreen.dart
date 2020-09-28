import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/checkEmptyField/FormMainScreen.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/checkEmptyField/FormScreenBloc.dart';

class FormHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: BlocProvider(
          create: (context) => FormScreenBloc(),
          child: FormMainScreen()
      ),
    );
  }
}
