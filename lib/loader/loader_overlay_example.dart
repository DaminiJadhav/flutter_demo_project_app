import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverlayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(

      useDefaultLoading: true,

      child: LoaderOverlayShow(
        
        
      ),
    );
  }
}

class LoaderOverlayShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Loader......."),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async{
                context.showLoaderOverlay();
                await Future.delayed(Duration(seconds: 3));
                context.hideLoaderOverlay();
              },
              child: Text('Show loader overlay for 2 seconds'),
            )
          ],
        ),
      ),
    );
  }
}

