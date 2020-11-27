import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
      ),
      body: Column(
        children: <Widget>[
          file!=null ? Container(
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: ExactAssetImage(file.path),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.red, width: 5.0),
              borderRadius:
              BorderRadius.all(const Radius.circular(20.0)),
            ),
          ) : SizedBox(
                width: 0.0,
              ),
          SizedBox(
            height: 100.0,
          ),
          file!=null ? RaisedButton(
            child: Text("Upload Image"),
            onPressed: () async {
              var res=await uploadImage(file.path);
              setState(() {
                print("Upload image : "+res);
              });
            },
          )
              : SizedBox(
            width: 50.0,
          ),
          file == null
              ? RaisedButton(
            child: Text("Open Gallery"),
            onPressed: () async {
              file = await ImagePicker.pickImage(
                  source: ImageSource.gallery);
              setState(() {});
            },
          )
              : SizedBox(
            width: 0.0,
          )
        ],
      ),
    );
  }

  Future<String> uploadImage(filename) async{

    var serverReceiverPath = "https://www.developerlibs.com/upload";
    var request=http.MultipartRequest('POST',Uri.parse(serverReceiverPath));
    request.files.add(await http.MultipartFile.fromPath("picture", filename));
    var res=await request.send();
    return res.reasonPhrase;
  }
}
