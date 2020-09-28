

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerApp extends StatefulWidget {
  @override
  _ShimmerAppState createState() => _ShimmerAppState();
}

class _ShimmerAppState extends State<ShimmerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shimmer effect"),),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child:Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 3),
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
                        child: Text('Hello'),
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
              baseColor: Colors.grey[700],
              highlightColor: Colors.grey[100])
        ),
      ),
    );
  }
}
