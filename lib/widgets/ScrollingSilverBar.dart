import 'package:flutter/material.dart';

class ScrollingSilverBar extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SliverExample(
        bodyWidgets: Text(
            'Hello Body gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'),
        backgroundWidget: Text('Hello Background'),
      ),
    );
  }
}

class SliverExample extends StatefulWidget {
  final Widget backgroundWidget;
  final Widget bodyWidgets;

  SliverExample({
    this.backgroundWidget,
    this.bodyWidgets,
  });

  @override
  _SliverExampleState createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {

  ScrollController _scrollController;
  Color _theme ;

  @override
  void initState() {
    super.initState();
    _theme = Colors.black;

    _scrollController = ScrollController()
      ..addListener(
            () => _isAppBarExpanded ?
        _theme != Colors.white ?
        setState(
              () {
            _theme = Colors.white;
            print(
                'setState is called');
          },
        ):{}
            : _theme != Colors.black ?
        setState((){
          print(
              'setState is called1');
          _theme = Colors.black;
        }):{},

      );
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    // To change the item's color accordingly
    // To be used in multiple places in code
    //Color itemColor = isAppBarExpanded ? Colors.white : Colors.black;

    // In my case PrimaryColor is white,
    // and the background widget is dark

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: BackButton(
              color: _theme, // Here
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: _theme, // Here
                ),
                onPressed: () {},
              ),
            ],
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'title',
                style: TextStyle(
                  fontSize: 18.0,
                  color: _theme, // Here
                ),
              ),
              // Not affecting the question.
              background: widget.backgroundWidget,
            ),
          ),
          // Not affecting the question.
          SliverToBoxAdapter(child: widget.bodyWidgets),
        ],
      ),
    );
  }
}