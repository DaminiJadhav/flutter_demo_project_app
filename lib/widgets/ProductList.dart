

import 'package:flutter/material.dart';

void main(){
  runApp(ProductList());
}
class ProductList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyProductList() ,
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}


class MyProductList extends StatelessWidget{

  MyProductList({Key key,this.title}):super(key:key);
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
        children: <Widget>[
          ProductBox( name: "iPhone",
                      description: "iPhone is the top branded phone ever",
                      price: 55000,
                      image: "apple_phone.jpg"  ),
          ProductBox(
              name: "Android",
              description: "Android is a very stylish phone",
              price: 10000,
              image: "android.jpg"
          ),
          ProductBox(
              name: "Tablet",
              description: "Tablet is a popular device for official meetings",
              price: 25000,
              image: "tablet.jpg"
          ),
          ProductBox(
              name: "Laptop",
              description: "Laptop is most famous electronic device",
              price: 35000,
              image: "laptop.jpg"
          ),
          ProductBox(
              name: "Desktop",
              description: "Desktop is most popular for regular use",
              price: 10000,
              image: "desktop.jpg"
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}

class ProductBox extends StatelessWidget{

  ProductBox({Key key, this.name, this.description, this.price, this.image}) :
        super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 100,
      child: Card(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset("assets/"+image),
          Expanded(
            child: Container(
              padding:EdgeInsets.all(5) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  this.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(this.description),
                Text("Price :"+this.price.toString())
              ],
            ),),
          )
        ],
      ),),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}