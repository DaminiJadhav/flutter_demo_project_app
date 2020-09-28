

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlApp extends StatefulWidget {
  @override
  _LaunchUrlAppState createState() => _LaunchUrlAppState();
}

class _LaunchUrlAppState extends State<LaunchUrlApp> {
  final String telephoneNumber = "01817658822";

  Future<void> _launchURL() async{
    const url='https://flutter.dev';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch URL'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('Show Flutter homepage'),
            ),
            RaisedButton(
              onPressed: () async{
                    String telephoneurl='tel:$telephoneNumber';
                    if(await canLaunch(telephoneurl)){
                      await launch(telephoneurl);
                    }else{
                     throw 'Could not launch $telephoneurl';
                    }
              },
              child: Text('telephone'),
            ),
          ],
        ),

      ),
    );
  }
}
