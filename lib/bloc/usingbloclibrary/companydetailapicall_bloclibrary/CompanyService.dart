import 'dart:convert';

import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/company_response_model.dart';
import 'package:http/http.dart' as http;
class CompanyService{
  
  Future<List<JobPositionModel>> searchJobPosition(String position, String location) async {
    final String url = 'https://jobs.github.com/positions.json?description=$position&location=$location';
    var r = await http.get(url);
    print("Job Api response ${r.body}");
    if(r.statusCode == 200 || r.statusCode == 210){
        Iterable data = List.from(json.decode(r.body));
        List<JobPositionModel> result = data.map((json) =>
            JobPositionModel.fromJson(json)).toList();

        return result;
    }else{
      return throw Exception('Unable to connect with server');
    }
  }
}