

import 'package:flutter/foundation.dart';
import 'package:flutterdemoprojectapp/api/PaginationApi/Repository/MovieRepository.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StudnetProdRepository implements MovieRepository{

  @override
  Future<StudentDataResponse> fetchMovie(int pagenumber) async{
    try{
      var url="https://randomuser.me/api?page="+pagenumber.toString()+"&results=8&seed=abc";

      final response=await http.get(url);
      print(url);
//      print(response.body);

      if(response.statusCode==200){
        StudentDataResponse studentDataResponse=welcomeFromJson(response.body);
        return studentDataResponse;

      }else{
        return StudentDataResponse();
      }
    }catch(e) {
      return StudentDataResponse();
    }

    // TODO: implement fetchMovie
    throw UnimplementedError();

  }

}

