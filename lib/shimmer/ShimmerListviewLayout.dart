
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerListviewLayout extends StatefulWidget {
  @override
  _ShimmerListviewLayoutState createState() => _ShimmerListviewLayoutState();
}

class _ShimmerListviewLayoutState extends State<ShimmerListviewLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer layout'),
      ),
      body: DelayListView(),
    );
  }


}

class ShimmerList extends StatelessWidget {
  int offset =0;
  int time=800;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: 9,
          itemBuilder: (BuildContext context,int index){
            offset+=5;
            time=800+offset;
            print(time);
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Shimmer.fromColors(
                  period: Duration(seconds: time),
                  child: ShimmerLayout(),
                  baseColor: Colors.grey,
                  highlightColor: Colors.white),
            );
          }),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Column(
            children:[0,1,2,3].map((index) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 48.0,
                        height: 48.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )).toList()
        ),

      ),
    );
  }
}



class DelayListView extends StatefulWidget {
  @override
  _DelayListViewState createState() => _DelayListViewState();
}

class _DelayListViewState extends State<DelayListView> {
  bool isloading=true;
  @override
  Widget build(BuildContext context) {
    Timer timer=Timer(Duration(seconds: 3),(){
      setState(() {
        isloading=false;
      });
    });
    return isloading ? ShimmerList() : DataList(timer);
  }
}

class DataList extends StatelessWidget {
  Timer timer;
  DataList(this.timer);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context ,i){
          return Container(
            padding: EdgeInsets.all(10),
            child: Text(i.toString()),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink)
            ),
          );
        });
  }
}


