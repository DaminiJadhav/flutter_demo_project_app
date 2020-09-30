import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/api/putApi/put_api_service.dart';

class PutApiScreen extends StatefulWidget {
  @override
  _PutApiScreenState createState() => _PutApiScreenState();
}

class _PutApiScreenState extends State<PutApiScreen> {
  TextEditingController reviewController=new TextEditingController();
  bool editReview=false;

  @override
  void initState() {
    super.initState();
    setState(() {
      editReview=false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put api'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller:reviewController ,
              decoration: InputDecoration(
                hintText: "Review"
              ),
              onChanged: (value){
                setState(() {
                  if(value!=null){
                    print('review ');
                    editReview=true;
                  }else{
                    print('null');
                  }
                });
              },
            ),
            if(editReview==true) RaisedButton(
              child: Text('Edit review'),
              onPressed: _EditReviewApiCallMethod,
            )
          ],
        ),
      ),
    );
  }

  void _EditReviewApiCallMethod() async{
    PutApiService putApiService=new PutApiService();
    await putApiService.putUserReview(reviewController.text);

  }
}
