
import 'User.dart';
import 'package:http/http.dart' as http;
class Service{
  static const String url="https://jsonplaceholder.typicode.com/users";


  static Future<List<User>> getUsers() async{
    print(url);
    try{
      final response=await http.get(url);
      print(response.body);

      if(response.statusCode==200){
        print(response.body);

        final List<User> user=userFromJson(response.body);
        return user;
      }else{
        return List<User>();

      }
    }catch(e){
      return List<User>();
    }
  }
}