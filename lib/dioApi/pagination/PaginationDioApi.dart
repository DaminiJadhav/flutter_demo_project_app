import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PaginationDioApi extends StatefulWidget {
  @override
  _PaginationDioApiState createState() => _PaginationDioApiState();
}

class _PaginationDioApiState extends State<PaginationDioApi> {

  final dio=new Dio();
  ScrollController scrollController=new ScrollController();
  int page=0;
  bool isloading=false;
  List user =new List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getMoredata(page);
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
         _getMoredata(page);
         print("Pages $page ");

      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  void _getMoredata(int index) async{
    if(!isloading){
      setState(() {
        isloading=true;
      });

      var url="https://randomuser.me/api/?page=" +
          index.toString() +
          "&results=20&seed=abc";

      print(url);
      final response=await dio.get(url);
      print(response.data['results'].toString());
      List tList = new List();
      for(int i=0;i<response.data['results'].length;i++){
        tList.add(response.data['results'][i]);
      }
      setState(() {
        isloading=false;
        user.addAll(tList);
        page++;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page'),
      ),
      body: Container(
        child: _buildlist(),
      ),
    );
  }


  Widget _buildlist(){
    return ListView.builder(
        itemCount: user.length+1,
        itemBuilder: (BuildContext context,int index){
          if(index==user.length){
            return _buildProgressIndicator();
          }else{
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user[index]['picture']['large']),
              ),
              title:  Text((user[index]['name']['first'])),
              subtitle: Text((user[index]['email'])),
            );
          }
        },
        controller: scrollController,
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Opacity(
        opacity: isloading ? 1.0 :0.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
