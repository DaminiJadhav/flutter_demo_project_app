import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberAuthentication extends StatefulWidget {
  @override
  _PhoneNumberAuthenticationState createState() => _PhoneNumberAuthenticationState();
}

class _PhoneNumberAuthenticationState extends State<PhoneNumberAuthentication> {
  String phno,smssend,verificationid;

  Future<void> verifyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrive=(String verId){
      verificationid=verId;
    };

    final PhoneCodeSent smsCodeSend=(String verId,[int forceCodeResend]){
        this.verificationid=verId;
    };

//    final  PhoneVerificationCompleted  verificationCompleted=(AuthCredential auth){
//
//    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticate'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "enter phone number"
            ),
            onChanged: (value){
                this.phno=value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("verify"),
            onPressed: (){

            },
          )
        ],
      ),
    );
  }


}
