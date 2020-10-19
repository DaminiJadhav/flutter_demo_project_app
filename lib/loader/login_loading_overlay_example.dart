import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginLoaderOverlay extends StatefulWidget {
  @override
  _LoginLoaderOverlayState createState() => _LoginLoaderOverlayState();
}

class _LoginLoaderOverlayState extends State<LoginLoaderOverlay> {


  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

//   VoidCallback  _onSignIn;
  // manage state of modal progress HUD widget
  bool _isLoading = false;
  String _username;
  String _password;
  bool _isLoggedIn = false;
  bool _isInvalidAsyncUser = false; // managed after response from server
  bool _isInvalidAsyncPass = false; // managed after response from server

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Progress HUD Demo'),
        backgroundColor: Colors.blue,
      ),
      body: LoadingOverlay(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: buildLoginForm(context),
          ),

        ),
        isLoading: _isLoading,
        // demo of some additional parameters
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.red,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),

        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // run the validators on reload to process async results
    _loginFormKey.currentState?.validate();
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key('username'),
              decoration: InputDecoration(hintText: 'enter username', labelText: 'User Name'),
              style: TextStyle(fontSize: 20.0, color: textTheme.button.color),
              validator: _validateUserName,
              onSaved: (value) => _username = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key('password'),
              obscureText: true,
              decoration: InputDecoration(hintText: 'enter password', labelText: 'Password'),
              style: TextStyle(fontSize: 20.0, color: textTheme.button.color),
              validator: _validatePassword,
              onSaved: (value) => _password = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: RaisedButton(
              onPressed: _submit,
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoggedIn
                ? Text(
              'Login successful!',
              key: Key('loggedIn'),
              style: TextStyle(fontSize: 20.0),
            )
                : Text(
              'Not logged in',
              key: Key('notLoggedIn'),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
  String _validateUserName(String userName) {
    if (userName.length < 8) {
      return 'Username must be at least 8 characters';
    }
    if (_isInvalidAsyncUser) {
      // disable message until after next async call
      _isInvalidAsyncUser = false;
      return 'Incorrect user name';
    }
    return null;
  }
  String _validatePassword(String password) {
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (_isInvalidAsyncPass) {
      // disable message until after next async call
      _isInvalidAsyncPass = false;
      return 'Incorrect password';
    }

    return null;
  }
  void _submit() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();

      // dismiss keyboard during async call
//      FocusScope.of(context).requestFocus(FocusNode());

      // start the modal progress HUD
      setState(() {
        _isLoading = true;
      });

      // Simulate a service call
      Future.delayed(Duration(seconds: 1), () {
        final _accountUsername = 'username1';
        final _accountPassword = 'password1';
        setState(() {
          if (_username == _accountUsername) {
            _isInvalidAsyncUser = false;
            if (_password == _accountPassword) {
              // username and password are correct
              _isInvalidAsyncPass = false;
              _isLoggedIn = true;
            } else {
              // username is correct, but password is incorrect
              _isInvalidAsyncPass = true;
            }
          } else {
            // incorrect username and have not checked password result
            _isInvalidAsyncUser = true;
            // no such user, so no need to trigger async password validator
            _isInvalidAsyncPass = false;
          }
          // stop the modal progress HUD
          _isLoading = false;
        });
        if (_isLoggedIn) {
          // do something
//          widget._onSignIn();
        }
      });
    }
  }


}