import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserApiProvider.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserResponse.dart';

class UserRepository{
  UserApiProvider apiProvider=UserApiProvider();


  Future<UserResponse>  getUserData(){
    return apiProvider.getUser();
  }
}