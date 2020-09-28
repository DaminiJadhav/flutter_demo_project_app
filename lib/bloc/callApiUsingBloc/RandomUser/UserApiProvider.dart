import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserResponse.dart';
import 'package:http/http.dart' as http;

class   UserApiProvider{
  final String _endpoint = "https://randomuser.me/api/";
//  final Dio _dio = Dio();

  Future<UserResponse> getUser() async {

    try{
      final response = await http.get(
          _endpoint);
          return UserResponse.fromJson(json.decode(response.body));
    }catch(error,stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
//    try {
//      Response response = await _dio.get(_endpoint);
//      return UserResponse.fromJson(response.data);
//    } catch (error, stacktrace) {
//      print("Exception occured: $error stackTrace: $stacktrace");
//      return UserResponse.withError("$error");
//    }
  }
}