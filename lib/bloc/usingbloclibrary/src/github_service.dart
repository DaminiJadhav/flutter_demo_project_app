
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'models.dart';

class GithubService{


  Future<List<JobPositionModel>> searchJob(String position, String location) async{

    final String url = 'https://jobs.github.com/positions.json?description=$position&location=$location';
    var r = await http.get(url);
    print(r.body);

    if(r.statusCode == 200 || r.statusCode == 210){
      Iterable data = List.from(json.decode(r.body));
      List<JobPositionModel> result = data.map( (json) => JobPositionModel.fromJson(json)).toList();
      return result;
    }else{
      return throw Exception('Unable to connect with server');
    }
  }
}