
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

class DateTimePickerFormField extends StatefulWidget {
  @override
  _DateTimePickerFormFieldState createState() => _DateTimePickerFormFieldState();
}

class _DateTimePickerFormFieldState extends State<DateTimePickerFormField> {
//  final format= DateFor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Form'),
      ),
      body: Column(
        children: <Widget>[
          DateTimeField(
            onShowPicker: (context,currentvalue){
              return showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2002), lastDate: DateTime(2022));
            },
          ),

//          DateTimeField(
//            onShowPicker: (context,current){
//              return showTimePicker(context: context, initialTime: DateTime.now());
//            },
//          )
        ],
      ),
    );
  }
}
