

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
    title: 'Dynamic Links Example',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => DynamicLinkApp(),
      '/helloworld': (BuildContext context) => _DynamicLinkScreen(),
    },
  ));
}


class DynamicLinkApp extends StatefulWidget {
  @override
  _DynamicLinkAppState createState() => _DynamicLinkAppState();
}

class _DynamicLinkAppState extends State<DynamicLinkApp> {
  String _testString =
      "To test: long press link and then copy and click from a non-browser "
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      "is properly setup. Look at firebase_dynamic_links/README.md for more "
      "details.";
  bool iscreatinglink=false;
 String linkmessage='link';


 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initDynamiclink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dyanamic link'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: (){
          print('link $linkmessage');
          Share.share(linkmessage,subject: "Hello",);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('long link'),
             onPressed: !iscreatinglink ? () => _createdynamiclink(false) : null,
            ),
            RaisedButton(
              child: Text('short link'),
              onPressed: !iscreatinglink ? () => _createdynamiclink(true) : null,
            ),
           InkWell(
             child: Text(
               linkmessage ?? '',
               style: const TextStyle(color: Colors.blue),
             ),
             onTap: () async{
               if(linkmessage!=null){
                 await launch(linkmessage,universalLinksOnly: false);
               }
             },
             onLongPress: (){
               Clipboard.setData(ClipboardData(text: linkmessage));
//                 Scaffold.of(context).showSnackBar(SnackBar(content: Text('Copied link'),
//                 )
//                );
             },
           ),
           Text(linkmessage==null ? '' :_testString),
          ],
        ),
      ),
    );
  }


  Future<void> _createdynamiclink(bool short) async{
    setState(() {
      iscreatinglink=true;
    });
    final DynamicLinkParameters dyaminclink=DynamicLinkParameters(
      uriPrefix: "https://flutterdemoprojectapp.page.link",
      link: Uri.parse("https://flutterdemoprojectapp.page.link/helloworld"),
//      uriPrefix: "https://learndyanamic.link",
//      link: Uri.parse("https://learndyanamic.link/helloworld"),
      androidParameters: AndroidParameters(
          packageName:"com.example.flutterdemoprojectapp",
          minimumVersion: 0),
      iosParameters: IosParameters(
          bundleId: "com.google.firebase",
          minimumVersion: '0'),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          title: "Hello world",
          description: "it says hello world"
      ),
    );

    Uri url;
    if(short){
      final ShortDynamicLink shortDynamicLink=await dyaminclink.buildShortLink();
      print(shortDynamicLink.toString());
      url=shortDynamicLink.shortUrl;
    }else{
      url=await dyaminclink.buildUrl();
    }


    setState(() {
      linkmessage=url.toString();
      iscreatinglink=false;
    });


  }

  void initDynamiclink() async{



     FirebaseDynamicLinks.instance.onLink(
         onSuccess: (PendingDynamicLinkData dynamicLink) async{
         final Uri deepLink= dynamicLink?.link;

         print("Url: "+deepLink.toString());
             if(deepLink!=null){
             Navigator.pushNamed(context, deepLink.path);
             }
         },
         onError: (OnLinkErrorException e) async{
              print('onLinkError');
              print(e.message);
          }
     );

     final PendingDynamicLinkData data=await FirebaseDynamicLinks.instance.getInitialLink();
     final Uri deeplink=data?.link;
     print("DeepLink $deeplink");
     if(deeplink!=null){
       Navigator.pushNamed(context, deeplink.path);
     }

  }

//  flutterdemoprojectapp.page.link
}

class _DynamicLinkScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World DeepLink'),
      ),
      body:  const Center(
        child: Text('Hello, World!'),
      ),
    );

  }

}
