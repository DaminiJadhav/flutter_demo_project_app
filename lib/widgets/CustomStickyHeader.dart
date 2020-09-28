


import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CustomStickHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Header'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return StickyHeaderBuilder(
            builder: (context, stuckAmount) {
              print('$index - $stuckAmount');
              stuckAmount = stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 100.0 - (50 * (1 - stuckAmount)),
                color: Color.lerp(Colors.blue, Colors.red, stuckAmount),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: ListTile(
                  trailing: Icon(Icons.bookmark_border),
                  title: Text('Title #$index'),
                ),
//                child: Text(
//                  'Title #$index',
//                  style: const TextStyle(color: Colors.white),
//                ),
              );
            },
            content: Column(
              children: <Widget>[
                Container(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('custom content'),
                    ),
                  ),
                )
              ],
            )
        );
      }));

    // TODO: implement build
    throw UnimplementedError();
  }

}