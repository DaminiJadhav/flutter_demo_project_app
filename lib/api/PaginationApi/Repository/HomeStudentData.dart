
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/api/PaginationApi/Repository/ProductRepository.dart';
import 'package:flutterdemoprojectapp/api/PaginationApi/Repository/StudentTile.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:flutterdemoprojectapp/pagination/StudentRepository.dart';

class HomeStudentData extends StatefulWidget {
  @override
  _HomeStudentDataState createState() => _HomeStudentDataState();
}

class _HomeStudentDataState extends State<HomeStudentData> {
  @override
  void initState() {
//    StudnetProdRepository().fetchMovie(1);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<StudentDataResponse>(
        future:StudnetProdRepository().fetchMovie(1),
        builder: (context,snapshots){
          if (snapshots.hasError)
            return Text("Error Occurred");
          switch(snapshots.connectionState){
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return StudentTile(studentDataResponse: snapshots.data,);
            default:
          }

        });
  }
}
