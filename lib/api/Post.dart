


class Post{
  final String userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});


factory Post.fromJson(Map<String,dynamic> json){
  return Post(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );
}

  Map tomap(){
    var map=new Map<String,dynamic>();
    map['userId']=userId;
//    map['id']=id;
    map["title"] = title;
    map["body"] = body;
    return map;
  }

}