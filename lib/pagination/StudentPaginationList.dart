
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/pagination/StudentControllerApi.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:flutterdemoprojectapp/pagination/StudentService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentPaginationList extends StatefulWidget {

  @override
  _StudentPaginationListState createState() => _StudentPaginationListState();
}

class _StudentPaginationListState extends State<StudentPaginationList> {

  StudentDataResponse _studentdata;
  ScrollController scrollController=new ScrollController();
  int page=1;
  bool isloading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


//
//    StudentService().fetchStudentData(page).then((studentdata) {
//      setState(() {
//        _studentdata=studentdata;
//      });
//    });

    _getMoredata(page);

    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        StudentService().fetchStudentData(page+1).then((studdata) {
          setState(() {
            _studentdata=studdata;
          });
        });
        print("Pages $page ");

      }
    });
//
//



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: Center(
        child:ListView.builder(
            itemCount: null==_studentdata ? 0 :_studentdata.results.length,
            itemBuilder: (BuildContext context,index){
            if(index==_studentdata.results.length){
               return  _buildProgressIndicator();
            }else{
                return ListTile(
                     leading: Image.network( _studentdata.results[index].picture.large),
                     title: Text(_studentdata.results[index].name.first),
                     subtitle: Text(_studentdata.info.page.toString()),
    );
    }
//              StudentDataResponse dataResponse=_studentdata[index];
            },
          controller: scrollController,
            )
    )
    );

  }


  void _getMoredata(int index) async {
    if(!isloading) {
      setState(() {
        isloading = true;
      });

      StudentService().fetchStudentData(page).then((studentdata) {
        setState(() {
          _studentdata=studentdata;
        });
      });

      setState(() {
        isloading=false;
//        _studentdata.results.addAll();
//        page++;
        print(page);
      });
    }

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
