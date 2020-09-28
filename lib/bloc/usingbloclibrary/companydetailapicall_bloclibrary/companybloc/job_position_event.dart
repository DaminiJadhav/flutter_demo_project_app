part of 'job_position_bloc.dart';

@immutable
abstract class JobPositionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class JobPositionEventSearch extends JobPositionEvent{

   final String jobPosition;

   JobPositionEventSearch(this.jobPosition);

   @override
  String toString() {
    // TODO: implement toString
    return "JobPositionEventSearch";
  }

  @override
  // TODO: implement props
  List<Object> get props => [jobPosition];

}
