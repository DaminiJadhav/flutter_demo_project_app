

import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:flutterdemoprojectapp/pagination/StudentService.dart';


enum LoadMoreStatus{LOADING,STABLE}

class DataProvider with ChangeNotifier{
  StudentService service;
  StudentDataResponse studentDataResponse;
  int totalpages=0;

  List<Result> get alldata => studentDataResponse.results;
  Info get infodata => studentDataResponse.info;

  LoadMoreStatus _loadMoreStatus=LoadMoreStatus.STABLE;
  getLoadMoreStatus() => _loadMoreStatus;

  DataProvider(){
    initStream();
  }

  void initStream() {
    service=new StudentService();
    studentDataResponse=new StudentDataResponse();
  }

  fetchallData(pageNumber) async{
    if(totalpages==0 || pageNumber<=totalpages){
       StudentDataResponse response=await service.fetchStudentData(pageNumber);

       if(studentDataResponse.results==null){
         print('not found record');

       }else{
         studentDataResponse.results.addAll(response.results);
         studentDataResponse=studentDataResponse;
         setLoadingStatus(LoadMoreStatus.STABLE);
       }
    }
    if(pageNumber>totalpages){
      setLoadingStatus(LoadMoreStatus.STABLE);

    }
  }

  setLoadingStatus(LoadMoreStatus loadMoreStatus){
      _loadMoreStatus=loadMoreStatus;
      notifyListeners();
  }
}