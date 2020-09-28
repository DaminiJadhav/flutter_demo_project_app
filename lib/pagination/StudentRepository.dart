
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';

abstract class StudentRepository{

  Future<StudentDataResponse> fetchstudentdata(int pagenumber);


}