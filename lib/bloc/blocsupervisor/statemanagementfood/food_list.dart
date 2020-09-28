import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/foodbloc/food_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/foodbloc/food_event.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/model/food.dart';




class  FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: BlocConsumer<FoodBloc,List<Food>>(
        cubit: BlocProvider.of<FoodBloc>(context),
        buildWhen: (List<Food> previous,List<Food> current){
//          if(current.length > previous.length ){
//            return true;
//
//          }
          return true;
        },
        listenWhen: (List<Food> previous,List<Food> current){
          if(current.length > previous.length ){
            return true;

          }
          return false;
        },
        builder: (context,foodlist){
          return ListView.builder(
            scrollDirection: Axis.vertical,
             shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: foodlist.length,

              itemBuilder: (context ,index){
                 return Card(
                    child: ListTile(
                      title: foodlist!=null ? Text(foodlist[index].name) : Text('food'),
                      onTap: (){
                        BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(index));
                      },
                    ),
                 );
              }
          );
        },listener: (BuildContext context, foodlist){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added'),));
      },
      ),
    );
  }
}

//class FoodList extends StatefulWidget {
//  @override
//  _FoodListState createState() => _FoodListState();
//}
//
//class _FoodListState extends State<FoodList> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.all(16),
//      child: BlocConsumer<FoodBloc,List<Food>>(
//        buildWhen: (List<Food> previous,List<Food> current){
////          if(current.length > previous.length ){
////            return true;
////
////          }
//          return true;
//        },
//        listenWhen: (List<Food> previous,List<Food> current){
//          if(current.length > previous.length ){
//            return true;
//
//          }
//          return false;
//        },
//        builder: (context,foodlist){
//          return ListView.builder(
//            scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//              padding: EdgeInsets.all(16),
//              itemCount: foodlist.length,
//              itemBuilder: (context ,index){
//                 return Card(
//                    child: ListTile(
//                      title: foodlist!=null ? Text(foodlist[index].name) : Text('food'),
//                      onTap: (){
//                        BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(index));
//                      },
//                    ),
//                 );
//              }
//          );
//        },listener: (BuildContext context, foodlist){
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added'),));
//      },
//      ),
//    );
//  }
//}
