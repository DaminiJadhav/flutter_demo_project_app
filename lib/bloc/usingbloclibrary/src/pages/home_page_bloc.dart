

import 'package:bloc/bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';

import '../git_repository.dart';
import 'home_page_events.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> implements BaseBloc {
  final GitRepository gitRepository;

  HomePageBloc({this.gitRepository}) : super(HomePageStateDefault());

//  @override
//  HomePageState get initialState => HomePageStateDefault();


  Stream<HomePageState> _mapSearchJobsState(HomePageEventSearch event) async* {
    try {
      yield HomePageStateSearching();
      var result = await gitRepository.searchJob(event.jobPosition, 'Remote');
      print(result);
      yield HomePageStateSearched(data: result);
    } catch (e) {
      print('error ${e.toString()}');
      yield HomePageStateError();
    }
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    if (event is HomePageEventSearch) {
      yield* _mapSearchJobsState(event);
    }
  }

  @override
  void dispose() {
    
    // TODO: implement dispose
  }
}
