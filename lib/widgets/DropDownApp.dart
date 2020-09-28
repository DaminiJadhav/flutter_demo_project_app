



import 'package:flutter/material.dart';

//void main() {
//  runApp(MaterialApp(home:DropDownApp()));
//}


class DropDownApp extends StatefulWidget {

  @override
  _DropDownAppState createState() => _DropDownAppState();
}

class _DropDownAppState extends State<DropDownApp> {
  Item selectedidex;
  List<Item> users = <Item>[
    const Item('Android',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Flutter',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
    const Item('ReactNative',Icon(Icons.format_indent_decrease,color:  const Color(0xFF167F67),)),
    const Item('iOS',Icon(Icons.mobile_screen_share,color:  const Color(0xFF167F67),)),
  ];
  List<String> list=["C","C++","PHP","Java","Android","Flutter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownApp'),
      ),
      body: DropdownButton<Item>(
          hint: Text('Select item'),
          value: selectedidex,
          onChanged: (pos){
            setState(() {
              selectedidex=pos;
            });
          },
        items: users.map((Item item) {
              return DropdownMenuItem(
                value: item,
                child: Row(
                  children: <Widget>[
                    item.icon,
                    SizedBox(width: 5.0,),
                    Text(
                      item.name,
                      style:  TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
        } ).toList()
//        [
//          DropdownMenuItem(
//            value: list,
//            child:
////            Row(
////              children: <Widget>[
//                Text('$list[$selectedidex]')
////              ],
////            ),
//          )
//        ],
      ),
    );
  }
}
class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}