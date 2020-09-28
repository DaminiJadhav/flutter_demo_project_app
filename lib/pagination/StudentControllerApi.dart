


import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:flutterdemoprojectapp/pagination/StudentRepository.dart';
import 'package:http/http.dart' as http;

class StudentControllerApi implements StudentRepository{
  @override
  Future<StudentDataResponse> fetchstudentdata(int pagenumber) {
    var url = "https://randomuser.me/api/?page=" +
        pagenumber.toString() +
        "&results=20&seed=abc";

    print(url);
   var response=http.get(url);
    print(response);
    
    // TODO: implement fetchstudentdata
    throw UnimplementedError();


  }

}