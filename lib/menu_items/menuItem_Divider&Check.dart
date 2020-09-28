
import 'package:flutter/material.dart';


class menuItem_DividerCheck extends StatefulWidget {
  @override
  _menuItem_DividerCheckState createState() => _menuItem_DividerCheckState();
}

class _menuItem_DividerCheckState extends State<menuItem_DividerCheck> {
  String selecteditem="one";
  List<String> checkvalue;

 void showMenuItemSelection(String value){

   if(checkvalue.contains(value)){
     checkvalue.remove(value);
   }else{
     checkvalue.add(value);
   }
 }

  bool handleClick(String value){
    checkvalue.contains(value);
//    switch(value){
//      case 1 :
//        break;
//      case 2 :
//        break;
//      case 3 :
//        break;
//    }

//    setState(() {
//      choiceValue=value;
//    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Menu divider & check'),
          actions: <Widget>[

            PopupMenuButton(
//              onSelected: handleClick,
              itemBuilder: (BuildContext context){
                var list=List<PopupMenuEntry<Object>>();
                list.add(
                  PopupMenuItem(
                    child: Text("Select language"),
                  )
                );
                list.add(
                  PopupMenuDivider(
                    height: 20.0,
                  )
                );
                list.add(
                  CheckedPopupMenuItem(
                    value: 'one',
                    checked: false,
                    child: Text('English'),
                  )
                );
                list.add(
                    CheckedPopupMenuItem(
                      value: 'two',
                      checked: false,
                      child: Text('Marathi'),
                    )
                );
                list.add(
                    CheckedPopupMenuItem(
                      value: 'three',
                      checked:false,
                      child: Text('Hindi'),
                    )
                );
            return list;
              },
            )
          ]
        ),
    );
  }
}
