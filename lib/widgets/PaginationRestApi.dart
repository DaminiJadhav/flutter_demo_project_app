
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginationRestApi extends StatefulWidget {
  @override
  _PaginationRestApiState createState() => _PaginationRestApiState();
}

class _PaginationRestApiState extends State<PaginationRestApi> {

  static int page=0;
  ScrollController controller=new ScrollController();
  bool isLoading=false;
  List users=new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMoredata(page);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body:Container(
          child: _buildList(),
      )
    );
  }


  Widget _buildList(){
    return ListView.builder(
        itemCount:users.length+1 ,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
//            title: Text(users[index]['results']['name']['first']),
//            subtitle: Text(users[index]['results']['email']),
          );
        });
  }


  void _getMoredata(int index) async{
    if(!isLoading){
      setState(() {
        isLoading=true;
      });

      var url="https://randomuser.me/api/?page="+index.toString()+"&results=20&seed=abc";

      print(url);

      final response=await http.get(url);
      print(response.body);
      List list=new List();
      list.add(response.body);

      setState(() {
        isLoading=false;
        users.addAll(list);
        page++;
      });
    }

  }
}


