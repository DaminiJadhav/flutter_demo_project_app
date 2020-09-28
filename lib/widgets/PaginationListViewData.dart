

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginationListViewData extends StatefulWidget {
  @override
  _PaginationListViewDataState createState() => _PaginationListViewDataState();
}

class _PaginationListViewDataState extends State<PaginationListViewData> {
  List mylist;
  ScrollController controller=ScrollController();
  int _currentMax=10;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mylist=List.generate(10, (index) => 'Item :$index');
    controller.addListener(() {
      if(controller.position.pixels==controller.position.maxScrollExtent){
        _getMoredata();
      }
    });
  }

  _getMoredata(){
    for(int i=_currentMax;i<_currentMax+10;i++){
      mylist.add("Item :${i+1}");
    }
    _currentMax=_currentMax+10;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination ListView'),
      ),
      body: ListView.builder(
        controller: controller,
        itemExtent: 70,
          itemCount: mylist.length+1,
          itemBuilder: (context,i){
              if(i==mylist.length){
//                return CircularProgressIndicator();

                return CupertinoActivityIndicator();
              }
            return ListTile(
              title: Text('${mylist[i]}'),
            );
          }),
    );
  }
}
