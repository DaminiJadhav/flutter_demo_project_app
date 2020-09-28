part of 'job_position_bloc.dart';


@immutable
abstract class JobPositionState extends Equatable {
  JobPositionState([List props=const []]) : super();
}

class JobPositionStateDefault extends JobPositionState {
  @override
  String toString() {
    // TODO: implement toString
    return "JobPositionStateDefault";
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class JobPositionStateSearching extends JobPositionState{

  @override
  String toString() {
    // TODO: implement toString
    return "JobPositionStateLoading";
  }
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class JobPositionStatecError extends JobPositionState{
  final String message;

  JobPositionStatecError({this.message});

  @override
  String toString() {
    // TODO: implement toString
    return "JobPositionStatecError";
  }
  @override
  // TODO: implement props
  List<Object> get props => [message];

}

class JobPositionStateSearched extends JobPositionState{
  final List<JobPositionModel> data;

  JobPositionStateSearched({this.data});

  @override
  String toString() {
    // TODO: implement toString
    return "JobPositionStateSearched";
  }
  @override
  // TODO: implement props
  List<Object> get props => [data];

}



