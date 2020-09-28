
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Post.dart';


class HttpPostApi extends StatefulWidget {

  @override
  _HttpPostApiState createState() => _HttpPostApiState();
}

class _HttpPostApiState extends State<HttpPostApi> {

  Future<Post> post;
  _HttpPostApiState({Key key, this.post});
  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
  TextEditingController titleController=new TextEditingController();
  TextEditingController bodyController1=new TextEditingController();

  List<String> list=new List();
  @override
  void initState() {
    // TODO: implement initState

    list.add("hi");
    list.add("hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post api'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'title',labelText: 'Post title'
              ),
            ),
             TextField(
                controller: bodyController1,
                decoration: InputDecoration(
                    hintText: 'body',labelText: 'Post body'
                ),
             ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () async{
                Post value=new Post(userId: "123",id: 1,title: titleController.text,body: bodyController1.text);
                Post p=await createPost(CREATE_POST_URL,body: value.tomap());
                list.add("title ${p.title} \n body ${p.body}");
                print("list length :${list.length}");
//                for(int i=0;i<list.length;i++){
//                  print(list[i]);
//                }

                print("Title :${p.title} \n Body : ${p.body}");
              },
            ),
//            Container(
//              child: ListView.builder(
//                itemCount: list.length,
//                itemBuilder: (BuildContext context,int pos){
//                  return Column(
//                    children: <Widget>[
//                      Text(list[pos]),
//                      Divider(height: 10.0,)
//
//                    ],
//                  );
//                },
//              ),
//            )
          ],
        ),
      ),
    );
  }
}

Future<Post> createPost(String url,{Map body}) async{
  return http.post(url, body: body).then((http.Response response) {
    final int  statuscode=response.statusCode;
    if(statuscode<200 || statuscode>400 || json==null){
      throw new Exception("Error while  fetching data");
    }else{
      return Post.fromJson(json.decode(response.body));
    }
  });
}
