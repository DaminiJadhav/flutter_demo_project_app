
import 'package:flutter/material.dart';


class TextFieldOutline extends StatefulWidget {

  @override
  _TextFieldOutlineState createState() => _TextFieldOutlineState();
}

class _TextFieldOutlineState extends State<TextFieldOutline> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfield'),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            enabled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.black87,)
            ),
//            disabledBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.all(Radius.circular(4)),
//              borderSide: BorderSide(width: 1,color: Colors.orange),
//            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, ),
            ),
            prefixIcon: const Icon(Icons.person, color: Colors.green,),
            suffixText: '+91',
            hintText: 'Mobile Number',
            helperText: '10 digit',
            labelText: 'Mobile No',
            errorText: "Wrong"
          ),
          controller: _controller,
          onSubmitted: (String value) async{
            await showDialog(context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: const Text('Thanks!'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('ok'),
                  )
                ],
              );
            });
          },

        ),
      ),
    );
  }
}
