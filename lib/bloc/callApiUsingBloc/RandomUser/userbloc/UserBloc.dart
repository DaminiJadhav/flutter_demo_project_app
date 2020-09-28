import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserRepository.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserResponse.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc implements BaseBloc{

  final UserRepository userRepository=UserRepository();
  final _userSubject=BehaviorSubject<UserResponse>();

  getUser() async{
    UserResponse response=await userRepository.getUserData();
    _userSubject.sink.add(response);
  }

  BehaviorSubject<UserResponse> get subjectresponse => _userSubject;

  @override
  void dispose() {
    // TODO: implement dispose
    _userSubject.close();
  }



}