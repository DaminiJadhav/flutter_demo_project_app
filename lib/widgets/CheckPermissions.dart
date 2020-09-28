

import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckPermissions extends StatefulWidget {
  @override
  _CheckPermissionsState createState() => _CheckPermissionsState();
}

class _CheckPermissionsState extends State<CheckPermissions> {
  PermissionStatus _status;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PermissionHandler().checkPermissionStatus(PermissionGroup.camera)
    .then(_updateStatus);


    print(PermissionGroup.values.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('permission'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text('$_status'),
              SizedBox(height: 80,),
              RaisedButton(
                child:Text('Ask permission'),
                onPressed: _askpermission,
              ),
              RaisedButton(
                child:Text('permission'),
                onPressed: (){
                  if(_status==PermissionStatus.granted){
                    print('Permission granted');
                  }else{
                    print('Not permission');
                  }
                },
              ),
              RaisedButton(
                child:Text('check internet connection'),
                onPressed: () async{
                  var connectivityResult=await Connectivity().checkConnectivity();
                  if(connectivityResult==ConnectivityResult.mobile){
                    _showDialog('Internet access', 'You are connected over mobile data');

                    print('mobile data');
                  }else if(connectivityResult==ConnectivityResult.wifi){
                    _showDialog('Internet access', 'You are  connected over wifi');

                    print('wifi');
                      var wifiBSSID=Connectivity().getWifiBSSID().toString();
                      var wifiIP=Connectivity().getWifiIP().toString();
                      var wifiName=Connectivity().getWifiName().toString();
                      print('wifi  $wifiBSSID. , $wifiIP ,$wifiName' );


                  }else if(connectivityResult==ConnectivityResult.none){
                      _showDialog('No internet', 'You are not connected internet');
                  }


                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateStatus(PermissionStatus status){
    if(status!=_status){
      setState(() {
        _status=status;
      });
    }
  }

  void _askpermission() {
    PermissionHandler().requestPermissions([PermissionGroup.camera])
    .then(_onStutusrequested);

  }


  void _onStutusrequested(Map<PermissionGroup,PermissionStatus> statuses) {
      final status=statuses[PermissionGroup.camera];

//      if(statuses[PermissionGroup.camera]==PermissionStatus.granted){
//        Scaffold.of(context).showSnackBar(SnackBar(content:Text('permission granted'),));
//      }
      if(status!=PermissionStatus.granted){
        print('Status $status');
//        PermissionHandler().openAppSettings();

      }else {
        print('Status $status');

        _updateStatus(status);
      }
  }

  
   void _showDialog(String title,String des){
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             title: Text('$title'),
             content: Text('$des'),
             actions: <Widget>[
               FlatButton(
                 child: Text('OK'),
                 onPressed: (){
                   Navigator.of(context).pop();
                 },
               )
             ],
           );
         }
     );
   }
}
