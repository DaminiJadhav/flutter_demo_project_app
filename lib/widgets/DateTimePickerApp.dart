
import 'package:flutter/material.dart';


class DateTimePickerApp extends StatefulWidget {
  @override
  _DateTimePickerAppState createState() => _DateTimePickerAppState();
}

class _DateTimePickerAppState extends State<DateTimePickerApp> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  DateTime selectedDate1 = DateTime.now();
  var finaldate,finaltime;
  TimeOfDay pickedTime=TimeOfDay.now();

  void callDatePicker() async{
    var date=await getDate();

    setState(() {
      finaldate=date;

//      _date.value=TextEditingValue(text: date.toString());
    });
  }

  Future<DateTime> getDate(){
    return  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2014),
        lastDate: DateTime(2022));
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay response = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );
    if (response != null && response != pickedTime) {
      setState(() {
        pickedTime = response;
        print('$pickedTime');
      });
    }
  }

  Future<TimeOfDay> getTime() async{
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(finaldate==null || pickedTime==null?'Select Date !':'Picked date : $finaldate $pickedTime'),
            RaisedButton(
              child: Text('select date'),
              onPressed: (){
                callDatePicker();
              },
            ),
            RaisedButton(
              child: Text('select time'),
              onPressed: (){
                _selectTime(context);
//                var time= getTime();
//                setState(() {
//                  finaldate=time;
////                  callDatePicker();
//
//                });
              },
            ),
        GestureDetector(
//          onTap: () => callDatePicker,
          child:TextFormField(
              onTap: () => _selectDate(context),
              controller: _date,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                suffixIcon:  Icon(
                  Icons.date_range,

                ),
              ),
            ),
        )
          ],
        ),
      ),
    );
  }

  Future<Null>  _selectDate(BuildContext context) async{
//    Focus.of(context).requestFocus(new FocusNode())
      DateTime picker=await showDatePicker(
          context: context, initialDate: DateTime.now(), firstDate: DateTime(2002), lastDate: DateTime(2022));
      if(picker!=null && picker!=selectedDate1)
        setState(() {
          selectedDate1=picker;
          _date.value=TextEditingValue(text: picker.toString());
        });
  }
}
