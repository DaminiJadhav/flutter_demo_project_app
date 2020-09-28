
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpGetApi extends StatefulWidget {
  @override
  _HttpGetApiState createState() => _HttpGetApiState();
}

class _HttpGetApiState extends State<HttpGetApi> {
  Future<Post> post;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post=fetchdata();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('api'),
        ),
        body:Center(
            child :FutureBuilder<Post>(
              future: post,
              builder: (context,abc){
                if(abc.hasData){
                  return Column(
                    children: <Widget>[
                      Text('Id : ${abc.data.id.toString()}'),
                      Text('UserId : ${abc.data.userid.toString()}'),
                      Text('Title : ${abc.data.title}'),
                      Text('Body : ${abc.data.body}'),

                    ],
                  );
                }else{
                  if(abc.hasError){
                    return Text("${abc.error}");
                  }else{

                  }
                }
                return CircularProgressIndicator();
              },

            )
        )
    );;
  }
}

Future<Post> fetchdata() async {

  final response=await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if(response.statusCode==200){
    return Post.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load post');
  }
}
class Post{
  int userid;
  int id;
  String title;
  String body;

  Post({this.userid,this.id,this.title,this.body});

  factory Post.fromJson(Map<String,dynamic> map){

    return Post(
      userid: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],

    );
  }

}



