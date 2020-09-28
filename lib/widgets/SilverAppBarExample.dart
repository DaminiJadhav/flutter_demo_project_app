


import 'package:flutter/material.dart';

class SilverAppBarExample extends StatefulWidget {
  @override
  _SilverAppBarExampleState createState() => _SilverAppBarExampleState();
}

class _SilverAppBarExampleState extends State<SilverAppBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SilverAppBar'),
            actions: <Widget>[
              Icon(Icons.timer)
            ],
            leading: Icon(Icons.menu),
//            backgroundColor: Colors.amberAccent,
            bottom: PreferredSize(
              child: Icon(Icons.ac_unit,size: 30.0,),
              preferredSize: Size.fromHeight(50.0),
            ),
            brightness: Brightness.dark,
//            expandedHeight: 40.0,
            flexibleSpace:ListView(
            children: <Widget>[
              Text('Sample 1'),
              Text('Sample 2'),
              Text('Sample 3'),

            ],
          ),
            floating: true,
            pinned: true,
            snap: true,
//            primary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(leading: Icon(Icons.volume_off), title: Text("Volume Off"),),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
            ]),
          )
        ],
      ),
    );
  }
}
