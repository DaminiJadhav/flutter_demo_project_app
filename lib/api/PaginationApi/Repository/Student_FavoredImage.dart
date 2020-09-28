import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/pagination/StudentDataResponse.dart';

class Student_FavoredImage  extends StatefulWidget {
  final Result result;
  Student_FavoredImage({@required this.result});

  @override
  _Student_FavoredImageState createState() => _Student_FavoredImageState();
}

class _Student_FavoredImageState extends State<Student_FavoredImage > {
  Result currentresult;
  bool like=false;



  @override
  void initState() {
    currentresult=widget.result;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(
             like ? Icons.star :Icons.star_border
          ),
          onPressed: (){
            onPressedbutt();
          },

        ),

      ),
    );
  }

  onPressedbutt(){
    setState(() {
      like=!like;
    });
  }
}
