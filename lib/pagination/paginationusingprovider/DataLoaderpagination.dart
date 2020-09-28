import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_provider.dart';

class DataLoaderPagination extends StatefulWidget {
  @override
  _DataLoaderPaginationState createState() => _DataLoaderPaginationState();
}

class _DataLoaderPaginationState extends State<DataLoaderPagination> {
  ScrollController scrollController=new ScrollController();
  int page=0;
  bool isloading=false;

  @override
  void initState() {
    var dataprovider=Provider.of<DataProvider>(context,listen: false);
    dataprovider.initStream();
    dataprovider.fetchallData(page);

    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        dataprovider.setLoadingStatus(LoadMoreStatus.LOADING);
        dataprovider.fetchallData(++page);
        print("Pages $page ");

      }
      });
//    });
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('infinite scrolling'),
      ),
      body: Consumer<DataProvider>(
        builder: (context,studentdatamodel,child){
           if(studentdatamodel!=null && studentdatamodel.alldata.length>0){
              return _listview(studentdatamodel,context);
            }
           return Center(child: CircularProgressIndicator(),);
        },
      ),
//      body: Consumer<DataProvider>(
//        builder:(context,studentdatamodel,child){
//          if(studentdatamodel!=null && studentdatamodel.alldata.length>0){
//            return _listview(studentdatamodel);
//          }
//          return Center(child: CircularProgressIndicator(),);
//        },),
    );
  }


  Widget _listview(DataProvider provider,BuildContext context){
    return ListView.separated(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return ListTile(
            title: Text(provider.alldata[index].email),
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
        itemCount: provider.alldata.length);
  }
}
