


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/util/Utility..dart';
import 'package:image_picker/image_picker.dart';


class SharedPreferenceLoadImage extends StatefulWidget {
  @override
  _SharedPreferenceLoadImageState createState() => _SharedPreferenceLoadImageState();
}

class _SharedPreferenceLoadImageState extends State<SharedPreferenceLoadImage> {
  Future<File> imagefile;
  Image imagefrompreference;

  pickImageFromGallery(ImageSource source){
    setState(() {
      imagefile=ImagePicker.pickImage(source: source);

    });
  }

  loadImageFrompreference(){
    Utility.getImagetoPreferences().then((img) {
      if(null==img){
        return;
      }
      setState(() {
        print("Image path ${img}");
        imagefrompreference=Utility.imageFromBase64String(img);
      });
    });
  }
  Widget ImagefromGallry(){
    return FutureBuilder<File>(
           future: imagefile,
           builder:(BuildContext context,AsyncSnapshot<File> snapshot){
             if(snapshot.connectionState==ConnectionState.done){
               if(null==snapshot.data){
                 return Text('Error',textAlign: TextAlign.center);
               }
              Utility.saveImagetoPreferences(Utility.base64String(snapshot.data.readAsBytesSync()));

               return Image.file(snapshot.data);
             }
             if(null!=snapshot.error){
               return Text('Error picking image',textAlign: TextAlign.center,);
             }
             return Text(
               'No Image Selected',
               textAlign: TextAlign.center,
             );
           },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image load'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              pickImageFromGallery(ImageSource.gallery);
              setState(() {
                imagefrompreference=null;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
                loadImageFrompreference();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ImagefromGallry(),
              null==imagefrompreference ? Container() :imagefrompreference
            ],
          ),
        ),
      ),
    );
  }
}
