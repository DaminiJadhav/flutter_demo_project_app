import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/api/PaginationApi/Repository/ProductRepository.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';

import 'StudentListTile.dart';

enum StudentLoadMoreStatus { LOADING, STABLE }
class StudentTile extends StatefulWidget {
  StudentDataResponse studentDataResponse;

  StudentTile({Key key,this.studentDataResponse}) :super(key:key);

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  StudentLoadMoreStatus studentLoadMoreStatus=StudentLoadMoreStatus.STABLE;
  final ScrollController scrollController = new ScrollController();
  List<Result> result;
  int currentPageNumber;
//  CancelableOperation movieOperation;

  @override
  void initState() {
    result=widget.studentDataResponse.results;
    currentPageNumber=widget.studentDataResponse.info.page;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotification,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
            childAspectRatio: 0.85

          ),
          controller: scrollController,
          itemCount: result.length,
          itemBuilder: (context,index){
            if(index==result.length){
              return _buildProgressIndicator();

            }else {
              return StudentListTile(result: result[index]);
            }
          }),
    );
  }



  bool onNotification(ScrollNotification notificatio){
    if(notificatio is ScrollUpdateNotification){
//      if(scrollController.position.maxScrollExtent>scrollController.offset && scrollController.position.maxScrollExtent - scrollController.offset <= 50){
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        if(studentLoadMoreStatus!=null && studentLoadMoreStatus==StudentLoadMoreStatus.STABLE){
          studentLoadMoreStatus=StudentLoadMoreStatus.LOADING;
          StudnetProdRepository().fetchMovie(currentPageNumber+1).then((data) {
            currentPageNumber=data.info.page;
            studentLoadMoreStatus=StudentLoadMoreStatus.STABLE;
            setState(() {
              result.addAll(data.results);
            });
          });

//          movieOperation=CancelableOperation

        }
      }
    }
  }

  Widget _buildProgressIndicator() {
    return Center(
//      child: Opacity(
//        opacity: StudentLoadMoreStatus.LOADING==true ? 1.0 :0.0,
        child: CupertinoActivityIndicator(),
//      ),
    );
  }
}
