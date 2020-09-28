import 'package:flutter/material.dart';

class SuccessBlocValidation extends StatefulWidget {
  @override
  _SuccessBlocValidationState createState() => _SuccessBlocValidationState();
}

class _SuccessBlocValidationState extends State<SuccessBlocValidation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login validation using Bloc'),
      ),
      body: Center(
        child: Text('Success'),
      ),
    );
  }
}
