
import 'package:flutter/material.dart';

void main() {
  runApp(SearchViewApp());
}


class SearchViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchViewAppState(),
    );
  }
}

class SearchViewAppState extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchViewAppState> {


  Widget appBarTitle = new Text("Search Sample", style: new TextStyle(color: Colors.white),);
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
//  final key=new GlobalKey(ScaffoldState());
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  List<String> filterlist;
  bool _IsSearching=true;
  String _searchText = "";

  void init(){
    _list=new List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
    _list.sort();
  }

  _State(){
    _searchQuery.addListener(() {
      if(_searchQuery.text.isEmpty){
        setState(() {
          _IsSearching=true;
          _searchText="";
        });
      }else{
        setState(() {
          _IsSearching=false;
          _searchText=_searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchView'),
      ),
//      appBar: buildBar(context),
      body: Column(
        children: <Widget>[
          _createSearchview(),
          _IsSearching ? _createlistview() :_performSearch()
        ],
//        children:
//          _IsSearching ? _buildSearchList() : _buildList(),

      ),
    );
  }





  Widget _createSearchview(){
    return Container(

      decoration: BoxDecoration(
        border: Border.all(width: 1.0)
      ),
      child:Stack(
        children: <Widget>[
      TextField(
        controller: _searchQuery,
        decoration: InputDecoration(
          hintText: "Search",
        ),
        textAlign: TextAlign.center,
      ),
          IconButton(
            icon: Icon(Icons.close),
              onPressed: (){
                _searchQuery.clear();
              },
          )
      ]
    )
    );
  }

  Widget _createlistview(){
    return Flexible(
      child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                   Text("${_list[index]}"),
                   Divider(height: 10.0,)
                ],


              ),
            );
          }),
    );
  }

  Widget _performSearch(){
        filterlist=new List<String>();
        for(int i=0;i<_list.length;i++){
          var item=_list[i];

          if(item.toLowerCase().contains(_searchText.toLowerCase())){
            filterlist.add(item);
          }
        }
        print(filterlist.length);

        return _createfilterlist();
  }

  Widget _createfilterlist(){
    return Flexible(
      child: ListView.builder(
          itemCount: filterlist.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Text("${filterlist[index]}"),
                  Divider(height: 10.0,)
                ],


              ),
            );
          }),
    );
  }


//  Widget buildBar(BuildContext context){
//    return new AppBar(
//      centerTitle: true,
//      title: appBarTitle,
//      actions: <Widget>[
//        new IconButton(icon: actionIcon, onPressed: (){
//          setState(() {
//            if(this.actionIcon.icon==Icons.search){
//              this.actionIcon = new Icon(Icons.close, color: Colors.white,);
//              this.appBarTitle=new TextField(
//                controller: _searchQuery,
//                style: new TextStyle(
//                  color: Colors.white,
//
//                ),
//                decoration: new InputDecoration(
//                    prefixIcon: new Icon(Icons.search, color: Colors.white),
//                    hintText: "Search...",
//                    hintStyle: new TextStyle(color: Colors.white)
//                ),
//              );
//              _handleSearchStart();
//            }
//            else{
//              _handleSearchEnd();
//            }
//          });
//        })
//      ],
//    );
//
//  }
//
//  void _handleSearchStart() {
//    setState(() {
//      _IsSearching = true;
//    });
//  }
//
//  void _handleSearchEnd() {
//    setState(() {
//      this.actionIcon=new Icon(Icons.search,color: Colors.white,);
//      this.appBarTitle =
//      new Text("Search Sample", style: new TextStyle(color: Colors.white),);
//      _IsSearching=false;
//      _searchQuery.clear();
//    });
//  }

}




