import 'package:equatable/equatable.dart';

abstract class CounterEventBlocLibrary extends Equatable{
  const CounterEventBlocLibrary();
}

class IncreamentEvent extends CounterEventBlocLibrary{
  @override
  // TODO: implement props
  List<Object> get props =>[];

}
class DecreamentEvent extends CounterEventBlocLibrary{
  @override
  // TODO: implement props
  List<Object> get props => [];

}