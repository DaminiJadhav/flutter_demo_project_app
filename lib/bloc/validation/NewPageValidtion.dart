import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NewPageValidation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  ApplicationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = new ApplicationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Test'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _buildText(),
          _buildText(),
          _buildText(),
          _buildText(),
          _buildText(),
          _buildName(),
          _buildEmail(),
          _buildSubmit()
        ],
      ),
    );
  }

  Widget _buildName() {
    return StreamBuilder(
      stream: _bloc.name,
      builder: (context, snapshot) {
        return TextField(
          controller: _nameController,
          onChanged: _bloc.changeName,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Name",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _buildText() {
    return SizedBox(height: 100, child: Text('Text\nbla\nbla\nbla'));
  }

  Widget _buildEmail() {
    return StreamBuilder(
      stream: _bloc.email,
      builder: (context, snapshot) {
        return TextField(
          controller: _emailController,
          onChanged: _bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _buildSubmit() {
    return StreamBuilder(
      stream: _bloc.submit,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: (!snapshot.hasData || !snapshot.data)
              ? null
              : () {
            _bloc.submitForm();
            _nameController.text = '';
            _emailController.text = '';
          },
          child: Text('Submit!'),
        );
      },
    );
  }
}

class ApplicationBloc {
  BehaviorSubject<String> _nameController =
  BehaviorSubject<String>();
  Stream<String>  get name => _nameController.stream.transform(validateName);
  Function(String) get changeName => _nameController.sink.add;

  BehaviorSubject<String> _emailController =
  BehaviorSubject<String>();
  Stream<String>  get email =>
      _emailController.stream.transform(validateEmail);
  Function(String) get changeEmail => _emailController.sink.add;


  Stream<bool> get submit => Rx.combineLatest2(
      name, email, (e, p) => e.isNotEmpty && p.isNotEmpty);

  submitForm() {
    //Send to api and wait
    //Reset values
    Future.delayed(const Duration(seconds: 1));
    _nameController.sink.add('');
    _emailController.sink.add('');
  }

  final validateName =
  StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty || name.length > 4) {
      sink.add(name);
    } else if (name.isNotEmpty) {
      sink.addError('Invalid Name!');
    }
  });

  final validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    if (email.isEmpty || (email.length > 4 && regExp.hasMatch(email))) {
      sink.add(email);
    } else {
      sink.addError('Invalid email!');
    }
  });

  //dispose/close all the streams when we call dispose() method
  void dispose() {
    _nameController.close();
    _emailController.close();
  }
}