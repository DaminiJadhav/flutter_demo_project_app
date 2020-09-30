import 'package:flutterdemoprojectapp/api/putApi/model/ReviewUpdate.dart';
import 'package:http/http.dart' as http;
class PutApiService{


   putUserReview(String review) async{
//      String request=ReviewUpdateToJson(reviewUpdate);
//      print(request);
      String url="https://oakstudio.azurewebsites.net/Services/api/NativeContent/PutContentReview?userId=688&UserUniqueIdentifire=eaa775cb-3acf-4c2b-95ae-11ae1f0f30cb&Msg="+review+"&Stars=4&contentId=4&details=0&reviewId=3";
      print(url);
      final response=await http.put(url);
      print(response.body);
      ReviewUpdate reviewUpdate=ReviewUpdateFromJson(response.body);
      print(reviewUpdate.reviewMsg);
      

   }

}