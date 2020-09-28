

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'formapp.dart';


class ExpandableStickyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable & sticky'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Expandable'),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ExpandableList())
              );
            },
          ),
          RaisedButton(
            child: Text('Sticky'),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>StickyList())
              );
            },
          )
        ],
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }

}

class ExpandableList extends StatelessWidget {
  final list=new List.generate(5, (index) => 'Item ${index+1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable list'),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context,i){
            return ExpansionTile(
                title: Text('Header ${i+1}'),
                children:list.map((val) => ListTile(
                  title:Text('Item $val'),
//                  title: Card(
//                    child: Column(
//                      children: <Widget>[
//                        Image.asset('assets/desktop.jpg'),
//                        Text('Item $val')
//                      ],
//                    ),
//                  ),
                  onTap: (){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$val'),));
                  },
                )).toList()
            );
          }),
    );

  }
}

class StickyList extends StatelessWidget {
  final list=new List.generate(5, (index) => 'Item ${index+1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky list'),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context,i){
            return StickyHeader(
              header:Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.0,
                color: Colors.amberAccent,
                child:Text('Header ${i+1}'),
              ) ,

              content: Column(
                children: <Widget>[
                  Image.asset('assets/desktop.jpg'),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Hi '),
                          Text('Hello '),
                          Text('welcome '),
                          Icon(Icons.shopping_cart),
                          RaisedButton(
                            child: Text('OK'),
                          )
                        ],
                      ),
                    ),
                  )
                ],
//                children:list.map((val) => ListTile(
//                  title: Text('$val'),
//                )).toList()
              ),
            );
          }),
    );
  }
}

