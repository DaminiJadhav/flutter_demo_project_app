import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/foodbloc/food_event.dart';
import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/model/food.dart';

class FoodBloc extends Bloc<FoodEvent,List<Food>>{
  FoodBloc() : super(List<Food>());

  @override
  Stream<List<Food>> mapEventToState(FoodEvent event ) async* {
      switch(event.eventType){
        case EventType.add:
          List<Food> newstate=List.from(state);
             if(event.food!=null){
               newstate.add(event.food);
             }
          yield newstate;
          break;
        case EventType.delete:
          List<Food> newstate=List.from(state);
          newstate.removeAt(event.foodIndex);
          yield newstate;
          break;
        default:
          throw Exception('Event not fount $event');
      }
  }


}