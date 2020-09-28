

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDatapickerApp extends StatefulWidget {
  @override
  _CupertinoDatapickerAppState createState() => _CupertinoDatapickerAppState();
}

class _CupertinoDatapickerAppState extends State<CupertinoDatapickerApp> {

 TextEditingController textEditingController;
  DateTime _dateTime=new DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Menu app'),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: CupertinoDatePicker(
//        mode: CupertinoDatePickerMode.time,
              initialDateTime: _dateTime,
              onDateTimeChanged: (DateTime newdate){
                print(newdate);
                setState(() {
                  _dateTime=newdate;
                });
              },
              use24hFormat: false,

            ),
          ),
          Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(
              controller: textEditingController,
              placeholder: 'Enter name',
              keyboardType: TextInputType.text,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: CupertinoColors.inactiveGray,
                ),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
