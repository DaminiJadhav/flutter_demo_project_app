import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/api/PaginationApi/Repository/Student_FavoredImage.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';




class StudentListTile extends StatelessWidget {
  StudentListTile({this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      color: Colors.white,
      elevation: 5.0,
      child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(result.picture.large),
            Student_FavoredImage(result:result),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0, right: 5.0),
                child: Text('Rating : ${result.name.first}'),
              ),  // Padding
            ),
          ]

      ),
    );
  }
}

