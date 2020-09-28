import 'package:flutter/material.dart';


void main() {
  runApp(homepage());
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
            child: IconButton(
              onPressed: (){
                print('click me');
              },
              icon: Icon(Icons.account_box),
            color: Colors.deepOrangeAccent,
          ),
//          child: Icon(Icons.image,
//                  color: Colors.blue,
//                  size: 50.0,),

//          child: Image.asset('assets/download.jpg'),
                

//        child: Text('This my first Flutter app',
//        style: TextStyle(
//          fontSize: 20.0,
//          fontWeight: FontWeight.bold,
//            letterSpacing: 2.0,
//          color: Colors.grey,
//            fontFamily: 'IndieFlower'
//        ),),
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Text('click'),
            backgroundColor: Colors.redAccent,
          ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

