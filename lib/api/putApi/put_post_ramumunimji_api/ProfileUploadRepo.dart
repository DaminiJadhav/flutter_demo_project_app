
import 'package:http/http.dart' as http;

import 'PostProfileRequest.dart';
import 'ProfileUpload.dart';



class ProfileUploadRepo{

  postProfile(PostProfileRequest postProfileRequest) async{
  String request = postProfileRequestToJson(postProfileRequest);
  print(request);
  String url = 'https://ramu.sdaemon.com/api/Customer/PosttblMstCustomer';
  Map<String, String> headers = {"Content-type": "application/json"};
  final response = await http.post(url, headers: headers, body: request);
  int statusCode = response.statusCode;
  print(statusCode);
  print(response.body);

  }



   putProfile(ProfileUpload profileUpload) async{
     String request = profileUploadToJson(profileUpload);
     print(request);
     String url = 'https://ramu.sdaemon.com/api/Customer/PuttblMstCustomer';
     Map<String, String> headers = {"Content-type": "application/json"};
     final response = await http.put(url,headers: headers,body: request);
     int statusCode = response.statusCode;
     print(statusCode);
     // this API passes back the id of the new item added to the body
     print(response.body);
//     ProfileUpdateReponse profileUpdateReponse = profileUpdateReponseFromJson(response.body);
//     Fluttertoast.showToast(
//         msg: "API Success" + profileUpdateReponse.rowsUpdated.firstName,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
  }



   makePostRequest() async {
     String url = 'https://ramu.sdaemon.com/api/Customer/PuttblMstCustomer';
     Map<String, String> headers = {"Content-type": "application/json"};
     String json = '{"CustomerID": 15,"FirstName": "Nikhil","LastName": "Choudhari","CompanyID": null,"HomeAddress": null,"OfficeAddress": null,"FromOfficeTime": null,"ToOfficeTime": null,"City": null,"CountryID": null,"PostalCode": null,"PhoneNo": "8805078548","AlternativePhoneNo": null,"Birthdate": null,"Email": null,"AddedBy": null,"AddedOn": null,"ModifiedBy": null,"ModifiedOn": null,"CompanyName": null,"CountryName": null}';
     // String url = 'https://ramu.sdaemon.com/api/tblMstDesignations/PosttblMstDesignation';
     // Map<String, String> headers = {"Content-type": "application/json"};
     // String json = '{"Designation": "Android","IsActive": "true","AddedBy": "","AddedOn": "","ModifiedBy": "","ModifiedOn": ""}';
     final response = await http.put(url, headers: headers, body: json);
     int statusCode = response.statusCode;
     print(statusCode);
     // this API passes back the id of the new item added to the body
     print(response.body);
   }


}