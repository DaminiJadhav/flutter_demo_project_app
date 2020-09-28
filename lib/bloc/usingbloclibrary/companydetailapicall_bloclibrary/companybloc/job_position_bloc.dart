import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionRepository.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/company_response_model.dart';
import 'package:flutterdemoprojectapp/bloc/validation/ValidationBloc.dart';
import 'package:meta/meta.dart';

part 'job_position_event.dart';
part 'job_position_state.dart';






class JobPositionBloc extends Bloc<JobPositionEvent, JobPositionState> implements BaseBloc{
  JobPositionRepository jobPositionRepository;

//  JobPositionBloc():super(JobPositionState());

  JobPositionBloc({this.jobPositionRepository}) : super(JobPositionStateDefault());


  @override
  Stream<JobPositionState> mapEventToState(
    JobPositionEvent event,
  ) async* {
    if(event is JobPositionEventSearch){
        yield* _mapSearchJobState(event);
    }
  }

  Stream<JobPositionState> _mapSearchJobState(JobPositionEventSearch jobPositionEventSearch) async*{
       try{
         yield JobPositionStateSearching();

         var result=await jobPositionRepository.searchJob(jobPositionEventSearch.jobPosition,"Remote");
         yield JobPositionStateSearched(data: result);
       }catch(e){
         print("Error ${e.toString()}");
         yield JobPositionStatecError(message: e.toString());
       }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
