


import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';



class Utility{
  static const String Image_Key="IMAGE_KEY";

  static Future<bool> saveImagetoPreferences (String imagevalue) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.setString(Image_Key, imagevalue);
  }

  static Future<String> getImagetoPreferences() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString(Image_Key);
  }

  static String base64String(Uint8List data){
    return base64Encode(data);

  }

  static Image imageFromBase64String(String base64String){
    return Image.memory(base64Decode(base64String),fit:BoxFit.fill);
  }

}