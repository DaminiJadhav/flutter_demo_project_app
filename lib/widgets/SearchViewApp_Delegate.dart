
import 'package:flutter/material.dart';



class SearchViewApp_Delegate extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Search Delegate'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: FoodSearchView());
          },)
        ],
      ),

    );
  }
}


class FoodSearchView extends SearchDelegate{


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear),
    onPressed: (){
      query="";

    },)];
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),
    onPressed: (){
      close(context, null);
    },);
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query,style: TextStyle(fontSize: 20.0)));
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final item=query.isEmpty ? loadFoodData()
        :loadFoodData().where((element) => element.title.startsWith(query)).toList();

//    :loadFoodData().where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();


    return item.isEmpty ? Center(child: Text('No Result Found.....',style: TextStyle(fontSize: 20.0),),):ListView.builder(
        itemCount: item.length,
        itemBuilder:(context,index){
          FoodItem foodItem=item[index];
          return ListTile(
            onTap: (){
              showResults(context);
            },
            title: Column(
              children: <Widget>[
                Text(foodItem.title ,style: TextStyle(fontWeight: FontWeight.bold),),
                Text(foodItem.category),
              Divider(height: 10.0,)

              ],
            ),
          );
        });
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}




class FoodItem{
  final String title;
  final String category;
  FoodItem({this.title, this.category});

}

List<FoodItem> loadFoodData(){
  var food=<FoodItem>[
      FoodItem(title:'chocolate shake',category: "milk shake"),
    FoodItem(title:'Hakka Noodles',category: "Chinese"),
    FoodItem(title:'samosa',category: "india"),
    FoodItem(title:'oreo shake',category: "milk shake"),
    FoodItem(title:'samosa',category: "india"),
    FoodItem(title:'Hakka Noodles',category: "Chinese"),
    FoodItem(title:'spring roll',category: "Chinese"),
    FoodItem(title:'pada pav',category: "india"),
    FoodItem(title:'Hakka Noodles',category: "Chinese"),



  ];
  return food;
}
