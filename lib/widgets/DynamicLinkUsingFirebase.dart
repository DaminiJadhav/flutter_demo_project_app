import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';



class DynamicLinkUsingFirebase extends StatefulWidget {

  @override
  _DynamicLinkUsingFirebaseState createState() => _DynamicLinkUsingFirebaseState();
}

class _DynamicLinkUsingFirebaseState extends State<DynamicLinkUsingFirebase> {
  bool isDynamiLink=false;
  String _linkMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDynamicLinks();

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
          Share.share(_linkMessage,subject: "Hello",);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('long link'),
            onPressed: !isDynamiLink ? () => _createDynamicLink(false) : null,
          ),
          RaisedButton(
            child: Text('short link'),
            onPressed: !isDynamiLink ? () => _createDynamicLink(true) : null,
          ),
          InkWell(
            child: Text(
              _linkMessage ?? '',
              style: const TextStyle(color: Colors.blue),
            ),
            onTap: () async{
              if(_linkMessage!=null){
//                await launch(linkmessage,universalLinksOnly: false);
              }
            },
            onLongPress: (){
              Clipboard.setData(ClipboardData(text: _linkMessage));
//                 Scaffold.of(context).showSnackBar(SnackBar(content: Text('Copied link'),
//                 )
//                );
            },
          ),
          Text(_linkMessage==null ? '' :"link"),
        ],
      ),
    );
  }


  Future<void> _createDynamicLink(bool short) async{
    setState(() {
      isDynamiLink=true;
    });


    final DynamicLinkParameters parameters=DynamicLinkParameters(
        uriPrefix: "https://flutterdemoprojectapp.page.link/dynamicLink",
        link: Uri.parse("https://flutterdemoprojectapp.page.link/dynamicLink/welcome"),
        androidParameters: AndroidParameters(packageName: "com.example.flutterdemoprojectapp",minimumVersion: 0),
        iosParameters: IosParameters(bundleId: "com.google.firebase",minimumVersion: '0'),
        dynamicLinkParametersOptions: DynamicLinkParametersOptions(
            shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: "The title of this dynamic link id welcome",
            description: "Welcome to flutter"
        )
    );


    Uri uri;
    if(short){
      final ShortDynamicLink shortDynamicLink=await parameters.buildShortLink();
      print(shortDynamicLink.toString());
      uri=shortDynamicLink.shortUrl;

    }else{
      uri=await parameters.buildUrl();
    }

    setState(() {
      _linkMessage=uri.toString();
      isDynamiLink=false;
    });
  }

  void initDynamicLinks() async{
    final PendingDynamicLinkData data=await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deeplink=data?.link;
    print("DeepLink $deeplink");
    if(deeplink!=null){
      Navigator.pushNamed(context, deeplink.path);

      print('_handleDeepLink | deeplink: $deeplink');
    }

    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData  dynamiclink) async{
        final Uri deeplink=dynamiclink?.link;
        print("Url: "+deeplink.toString());
        if(deeplink!=null){
          Navigator.pushNamed(context, deeplink.path);
        }
      },
        onError: (OnLinkErrorException e) async{
          print('onLinkError');
          print(e.message);
        }
    );
  }
}
