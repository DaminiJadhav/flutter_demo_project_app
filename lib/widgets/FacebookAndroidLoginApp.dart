


import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAndroidLoginApp extends StatefulWidget {
  @override
  _FacebookAndroidLoginAppState createState() => _FacebookAndroidLoginAppState();
}

class _FacebookAndroidLoginAppState extends State<FacebookAndroidLoginApp> {
  var facebooklogin=FacebookLogin();

  bool _isLoggedIn = false;
//  Map userProfile;
//
  _loginWithFB() async{

    final result=await facebooklogin.logIn(['email']);
    switch(result.status){
      case FacebookLoginStatus.loggedIn:
          final token=result.accessToken.token;
          print("LoggedIn  ${token}");
          onLoginSatusChanged(true);
          break;
      case FacebookLoginStatus.cancelledByUser:
          print("CancelledByUser");
          onLoginSatusChanged(false);
          break;
      case FacebookLoginStatus.error:
        print("Error");
        onLoginSatusChanged(false);
        break;
    }


  }

  void onLoginSatusChanged(bool isLogin){
    setState(() {
      this._isLoggedIn=isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook'),
      ),
      body: Container(
        child: Center(
          child: _isLoggedIn
              ? Text('Logged in')
              :RaisedButton(
                      child: Text('Login with facebook'),
                      onPressed: (){
                        print('Facebook');
                        _loginWithFB();
                      },
          )
        ),
      ),
    );
  }
}
