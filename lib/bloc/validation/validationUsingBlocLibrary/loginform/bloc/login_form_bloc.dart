import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/Email.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/bloc/login_form_event.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/bloc/login_form_state.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/password.dart';
import 'package:formz/formz.dart';

class LoginFormBloc extends Bloc<LoginFormEvent,LoginFormState>{
  LoginFormBloc() : super(LoginFormState());

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {

    if(event is EmailChanged){
      final email=Email.dirty(event.email);
      yield state.copyWith(
          email: email,
          status: Formz.validate([email,state.password]),
      );
    }
    else if(event is PasswordChanged){
      final password=Password.dirty(event.password);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email,password]),
      );
    }else if(event is FormSubmitted){
      if(state.status.isValidated){
        yield state.copyWith(
          status: FormzStatus.submissionInProgress
        );
        await Future.delayed(const Duration(seconds: 1));
        yield state.copyWith(
          status: FormzStatus.submissionSuccess
        );
      }
    }



  }

  @override
  void onTransition(Transition<LoginFormEvent, LoginFormState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
  }


}
