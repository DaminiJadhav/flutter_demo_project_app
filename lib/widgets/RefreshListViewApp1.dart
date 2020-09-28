import 'package:flutter/material.dart';


class RefreshListViewApp1 extends StatefulWidget {
  @override
  _RefreshListViewApp1State createState() => _RefreshListViewApp1State();
}

class _RefreshListViewApp1State extends State<RefreshListViewApp1> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
 int pos;
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.apps),
        title: Text("Pull to refresh"),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).accentColor,
        key: refreshKey,
//        backgroundColor: Colors.red,
        child: ListView.builder(
          itemCount:100,
            itemBuilder: (context,int index){

//              if(index==99){
//                pos=index;
//              }
              return  ListTile(
                title: Text("Item Text $index"),
              );
            }

        ),
        onRefresh: refreshList,
      ),
    );
  }
}
