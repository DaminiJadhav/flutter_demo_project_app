import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../models.dart';

@immutable
abstract class HomePageState extends Equatable {
  HomePageState([List props = const []]) : super();
}

class HomePageStateDefault extends HomePageState {
  @override
  String toString() => 'HomePageStateDefault';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageStateSearching extends HomePageState {
  @override
  String toString() => 'HomePageStateLoading';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageStateError extends HomePageState {
  final String message;

  HomePageStateError({this.message});

  @override
  String toString() => 'HomePageStateError';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageStateSearched extends HomePageState {
  final List<JobPositionModel> data;

  HomePageStateSearched({this.data});

  @override
  String toString() => 'HomePageStateLoaded';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
