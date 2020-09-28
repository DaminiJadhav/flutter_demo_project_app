

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image slider'),
      ),
      body: Container(
        height: 200.0,
        width: 350.0,
        child: Carousel(
          images: [
            AssetImage("assets/desktop.jpg"),
            AssetImage("assets/laptop.jpg"),
            AssetImage("assets/tab.jpg"),
          ],
          autoplay: true,
//          dotColor: Colors.blue,
          dotSize: 4.0,
          dotSpacing: 10.0,
//          indicatorBgPadding: 5.0,
          dotBgColor: Colors.pinkAccent,
          borderRadius: true,
//          moveIndicatorFromBottom: 180.0,
//            noRadiusForIndicator: true
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}