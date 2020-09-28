




import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/widgets/DateTimePickerApp.dart';
import 'package:flutterdemoprojectapp/widgets/ProductList.dart';
import 'package:flutterdemoprojectapp/widgets/ProgressIndicatorApp.dart';

void main(){
  runApp(BottomNavigation_Pageview1());
}


class BottomNavigation_Pageview1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation_state1_(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}


class BottomNavigation_state1_ extends StatefulWidget {

  @override
  _BottomNavigation_state_State createState() => _BottomNavigation_state_State();


}

class _BottomNavigation_state_State extends State<BottomNavigation_state1_> {
  int currentIndex1= 0;
  final List<Widget> _children=[ProductList(),ProgressIndicatorApp(),DateTimePickerApp()];
  PageController pagecontroller=PageController();

  void onTabTapped(int index){
    setState(() {
      currentIndex1=index;

    });
  }

  void onBottomTapped(int index ){
    setState(() {
      currentIndex1=index;
      pagecontroller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.slowMiddle);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationBar'),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentIndex1,
        onTap:(index){
          onBottomTapped(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.border_color),
              title: Text('Edit')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              title: Text('Photo')
          )
        ],
        selectedItemColor: Colors.blue,
      ),
      body:buildPageview()
    );
  }

  Widget buildPageview(){
    return PageView(
      pageSnapping: true,
      controller: pagecontroller,
      onPageChanged: (index){
        onTabTapped(index);
      },
      children: <Widget>[
        ProductList(),ProgressIndicatorApp(),DateTimePickerApp()
      ],
    );
  }
}
