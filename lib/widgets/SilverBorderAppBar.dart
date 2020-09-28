
import 'package:flutter/material.dart';

class SilverBorderAppBar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible space title',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              actions: <Widget>[IconButton(icon: Icon(Icons.favorite), onPressed: () {}), IconButton(icon: Icon(Icons.share), onPressed: () {})],
              floating: false,
              pinned: false,
              expandedHeight: 250 - MediaQuery.of(context).padding.top,
              flexibleSpace: Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1561752888-21eb3b67eb4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80'))),
              ),
              //bottom: _bottomWidget(context),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_listview(50)),
            ),
          ],
        ),
      ),
    );
  }
}

List _listview(int count) {
  List<Widget> listItems = List();

  listItems.add(Container(
    color: Colors.black,
    height: 50,
    child: TabBar(
      tabs: [FlutterLogo(), FlutterLogo()],
    ),
  ));

  for (int i = 0; i < count; i++) {
    listItems.add(new Padding(padding: new EdgeInsets.all(20.0), child: new Text('Item ${i.toString()}', style: new TextStyle(fontSize: 25.0))));
  }

  return listItems;
}