import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/checkEmptyField/ValidationEmptyfield.dart';

import 'FormScreenState.dart';
import 'FormScreenEvent.dart';
import 'fieldError.dart';

class FormScreenBloc  extends Bloc<FormScreenEvent, FormScreenState> with ValidationEmptyField{
  FormScreenBloc() : super(FormScreenState());

  @override
  Stream<FormScreenState> mapEventToState(FormScreenEvent event) async* {
    if (event is FormScreenEventSubmit) {
      yield FormScreenState(isBusy: true);

      if (this.isFieldEmpty(event.email)) {
        yield FormScreenState(emailError: FieldError.Empty);
        return;
      }

      if (!this.validationEmailAddress(event.email)) {
        yield FormScreenState(emailError: FieldError.invalid);
        return;
      }

      yield FormScreenState(submissionSuccess: true);
    }
  }

}