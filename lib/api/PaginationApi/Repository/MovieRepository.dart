

import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';

abstract class MovieRepository{

  Future<StudentDataResponse> fetchMovie(int pagenumber);

}