import 'package:flutter/material.dart';

class BottomSheetCheckBox extends StatefulWidget {
  @override
  _BottomSheetCheckBoxState createState() => _BottomSheetCheckBoxState();
}

class _BottomSheetCheckBoxState extends State<BottomSheetCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox bottom sheet'),
      ),
      body: RaisedButton(
        child: Text('Bottom Check box'),
        onPressed: (){
          _showModal();
        },
      ),


    );
  }


  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // You can wrap this Column with Padding of 8.0 for better design
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
               Text('HDH'),
               SizedBox(height: 5.0),
               Text('HDH'),
                SizedBox(height: 5.0),
                Text('HDH'),
          Text('HDH'),
          SizedBox(height: 5.0),
          Text('HDH'),
          SizedBox(height: 5.0),
          Text('HDH'),
          Text('HDH'),
          SizedBox(height: 5.0),
          Text('HDH'),
          SizedBox(height: 5.0),
          Text('HDH'),
        ]
        ),
        );
      },
    );
  }




}
