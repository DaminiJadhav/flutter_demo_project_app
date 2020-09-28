import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/CompanyService.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/company_response_model.dart';

class JobPositionRepository{
  CompanyService githubService = CompanyService();

  Future<List<JobPositionModel>> searchJob(String position, String location) {
    return githubService.searchJobPosition(position, location);
  }
}