import 'package:flutter/material.dart';


//void main(){
//  runApp(MaterialApp(
//    home: menuItemApp_Icon(),
//  ));
//}

class menuItemApp_Icon extends StatefulWidget {
  @override
  _menuItemApp_IconState createState() => _menuItemApp_IconState();
}

class _menuItemApp_IconState extends State<menuItemApp_Icon> {
  Choice choiceValue=Choice(title: 'Car', icon: Icons.directions_car);


  List<Choice> choices = const <Choice>[
    const Choice(title: 'Car', icon: Icons.directions_car),
    const Choice(title: 'Bicycle', icon: Icons.directions_bike),
    const Choice(title: 'Boat', icon: Icons.directions_boat),
    const Choice(title: 'Bus', icon: Icons.directions_bus),
    const Choice(title: 'Train', icon: Icons.directions_railway),
    const Choice(title: 'Walk', icon: Icons.directions_walk),
  ];

  void handleClick(Choice value){
     setState(() {
       choiceValue=value;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Items with icon'),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected:handleClick,
            itemBuilder: (BuildContext context){
              return choices.map((Choice choice) {
                return PopupMenuItem(
                  value: choice,
                  child:ListTile(
                    title: Text(choice.title),
                    leading: Icon(choice.icon),
                  )
                );
              }).toList();
            },
          )
        ],
      ),
        body:Card(
          child: Center(
            child: ListTile(
              title: Text(choiceValue.title),
              leading: Icon(choiceValue.icon),
            ),
          ),
        )

    );
  }
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

