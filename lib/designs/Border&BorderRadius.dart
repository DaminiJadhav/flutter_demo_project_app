
import 'package:flutter/material.dart';

class BorderBorderRadius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
       Scaffold(
        body:Container(
          width: double.infinity,
          child: Material(
              color: Colors.orange,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.all(40),
                child: Container(
                  margin: EdgeInsets.only(top: 50),

                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Lorem ipsum",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.close)
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,

                  borderRadius: BorderRadius.only(
                bottomLeft:  Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
                )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(15))
              ),
//            shape: Border(
//              right: BorderSide(
//                width: 1,
//                color: Colors.red,
//              ),
//              left: BorderSide(
//                width: 1,
//                color: Colors.green,
//              ),
//              bottom: BorderSide(
//                width: 1,
//                color: Colors.blue,
//              ),
//              top: BorderSide(
//                width: 1,
//                color: Colors.yellow,
//              ),
//            ),
            ),
        ),
//        ),

       ),
    );
  }
}
