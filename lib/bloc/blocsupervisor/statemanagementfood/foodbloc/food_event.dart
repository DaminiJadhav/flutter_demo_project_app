import 'package:flutterdemoprojectapp/bloc/blocsupervisor/statemanagementfood/model/food.dart';


enum EventType{add ,delete}

class FoodEvent{
  Food food;
  int foodIndex;

  EventType eventType;


  FoodEvent();

  FoodEvent.add(Food food){
      this.eventType=EventType.add;
      this.food=food;
  }

  FoodEvent.delete(int index){

    this.eventType=EventType.delete;
    this.foodIndex=index;
  }

}