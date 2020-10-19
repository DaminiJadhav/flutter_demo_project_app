import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';

class ProgressHubButtonExample extends StatefulWidget {
//  ProgressHUD _progressHUD;
//  ProgressHubButtonExample(this._progressHUD);
  @override
  _ProgressHubButtonExampleState createState() => _ProgressHubButtonExampleState();
}

class _ProgressHubButtonExampleState extends State<ProgressHubButtonExample> {
  ProgressHUD _progressHUD;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      text: 'Loading...',
      loading: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () async{
              _progressHUD.state.show();
              await Future.delayed(Duration(seconds: 3));
             _progressHUD.state.dismiss();
            },
            child: Text('Show progress hun 2 seconds'),
          )
        ],
      ),
    );
  }
}
