
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginApp extends StatefulWidget {
  @override
  _GoogleLoginAppState createState() => _GoogleLoginAppState();
}

class _GoogleLoginAppState extends State<GoogleLoginApp> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);

  _login () async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn=true;
      });
    }catch(err){
      print(err);
    }

  }
  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook'),
      ),
      body: Center(
        child: _isLoggedIn ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(_googleSignIn.currentUser.photoUrl,height: 50,width: 50,),
            Text(_googleSignIn.currentUser.displayName),
            OutlineButton(
              child: Text('Logout'),
              onPressed: (){
                _logout();
              },
            )
          ],
        ) :Center(
          child: OutlineButton(
            child: Text('Login with google'),
            onPressed: (){
              _login();
            },
          ),
        )
      ),
    );
  }
}
