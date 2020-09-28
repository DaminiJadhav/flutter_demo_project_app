import 'package:shared_preferences/shared_preferences.dart';

class SessionManage{
   String getStringValue;
   String _some_field = 'some_field';

    Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

    Future<String> getSomeStringData() async =>
       (await prefs).getString(_some_field) ?? '';

    Future setSomeStringData(String phone) async =>
       (await prefs).setString(_some_field, phone);

    Future setListdata(List<String> list) async{
      return (await prefs).setStringList("listData", list);
    }

    Future<List<String>> getListdata() async{
      return (await prefs).getStringList("listData");
    }

//----------------------------------------------------------------------

   Future<SharedPreferences>  getInstance() async
   {
     SharedPreferences preferences ;
     preferences = await SharedPreferences.getInstance();
     return preferences;
   }

   Future<bool> setdata(String data) async{
     return getInstance().then((pref) {
           return pref.setString("abc", data);
     });
   }

   Future<String> getdata() async{
     return getInstance().then((pref) {
              return pref.getString("abc");
     });
   }

  Future<String> getstringdata() async{
    final pref=await SharedPreferences.getInstance();
    getStringValue=pref.getString('my_string') ?? 0;
//    print('Get String $getStringValue');
    return getStringValue;

  }

   Future<String> setStringValue(String str) async{
    final pref=await SharedPreferences.getInstance();
    final key="my_string";
    final value='Welcome to flutter';
    pref.setString(key, str);
    print('Set String $str');
  }


  final String auth_token = "auth_token";

//set data into shared preferences like this
  Future<void> setAuthToken(String auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.auth_token, auth_token);
  }

//get value from shared preferences
  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String auth_token;
    auth_token = pref.getString(this.auth_token) ?? null;
    return auth_token;
  }

}