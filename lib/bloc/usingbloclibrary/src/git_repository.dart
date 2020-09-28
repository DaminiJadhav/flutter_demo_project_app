

import 'github_service.dart';
import 'models.dart';

class GitRepository{
  final githubService = GithubService();

  Future<List<JobPositionModel>> searchJob(String position, String location) async{
    return githubService.searchJob(position, location);
  }
}