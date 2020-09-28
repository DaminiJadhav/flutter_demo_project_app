
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HttpGetApiWithParameter extends StatefulWidget {


  @override
  _HttpGetApiWithParameterState createState() => _HttpGetApiWithParameterState();
}

class _HttpGetApiWithParameterState extends State<HttpGetApiWithParameter> {

  Future<Category> catergory;

  _HttpGetApiWithParameterState({Key key,this.catergory});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catergory=fetchdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API'),
      ),
      body: Center(
        child: FutureBuilder<Category>(
            builder: (context,index){
              if(index.hasData){
                return Column(
                  children: <Widget>[
                    Text('Description : ${index.data.CDescription}')
                  ],
                );
              }else{
                if(index.hasError){
                  return Text("${index.error}");
                }
              }
              return CircularProgressIndicator();

            }
        ),
      ),
    );
  }
}

Future<Category> fetchdata() async {

  bool movie=true;
  final response=await http.get('https://oakstudio.azurewebsites.net/Services/api/Category/GetCategory?ismovie=${movie}');
  if(response.statusCode==200){
    return Category.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load post');
  }
}
class Category{
  int CID;
  String CDescription;

  Category({this.CID,this.CDescription});

  factory Category.fromJson(Map<String,dynamic> map){

    return Category(
      CID: map['CategoryID'],
      CDescription: map['CategoryDescription'],


    );
  }

}





