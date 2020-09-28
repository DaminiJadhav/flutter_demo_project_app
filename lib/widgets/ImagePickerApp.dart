
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerApp extends StatefulWidget {
  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File _image;
  final picker=ImagePicker();

  Future getImage() async{
    final pickfile=await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image=File(pickfile.path);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image==null ? Text('No image selected') : Image.file(_image),
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'pick image',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> retriveLostData() async{
    final LostData lostData=await picker.getLostData();
    if(lostData==null){
      return;
    }
    if(lostData.file!=null){
        setState(() {
//          if(lostData.type==RetrieveType.video){
//            _handleVideo(lostData.file);
//          }else {
//            _handleImage(lostData.file);
//          }
        });
    }
    else {
//      _handleError(lostData.exception);
    }
  }
}
