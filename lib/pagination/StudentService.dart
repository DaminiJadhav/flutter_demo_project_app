

import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';
import 'package:http/http.dart' as http;

class StudentService{
  bool isloading=false;


  Future<StudentDataResponse> fetchStudentData(int page) async{

    try{
      var url="https://randomuser.me/api?page="+page.toString()+"&results=10&seed=abc";

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
  }
}