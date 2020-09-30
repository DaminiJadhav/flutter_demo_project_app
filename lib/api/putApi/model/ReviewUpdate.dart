

import 'dart:convert';

ReviewUpdate ReviewUpdateFromJson(String str) => ReviewUpdate.fromJson(json.decode(str));

String ReviewUpdateToJson(ReviewUpdate data) => json.encode(data.toJson());

class ReviewUpdate{
   int status;
   String reviewMsg;

   ReviewUpdate({this.status,this.reviewMsg});

   factory ReviewUpdate.fromJson(Map<String,dynamic> json) {
     return ReviewUpdate(
         status :json["Status"],
         reviewMsg : json["Message"]
     );
   }

    Map<String ,dynamic> toJson() =>{
     "Status":status,
     "Message":reviewMsg
    };
}