import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/api/jsonparseing/Service.dart';
import 'package:flutterdemoprojectapp/api/jsonparseing/User.dart';

class HttpGetApiJsonParsing extends StatefulWidget {
  @override
  _HttpGetApiJsonParsingState createState() => _HttpGetApiJsonParsingState();
}

class _HttpGetApiJsonParsingState extends State<HttpGetApiJsonParsing> {

  List<User> _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Service.getUsers().then((user) {
      setState(() {
        _user=user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null==_user? 0 : _user.length,
            itemBuilder: (context,index){
              User user=_user[index];
              return ListTile(
                title: Text(user.name),
                subtitle:Text(user.address.city),
              );
            }),
      ),
    );
  }
}
