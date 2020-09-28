import 'package:formz/formz.dart';

enum PassValidationError{ invalid }

class Password extends FormzInput<String ,PassValidationError>{
  const Password.pure() : super.pure('');
  const Password.dirty(String value) : super.dirty(value);


  static final _passwordregex=RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'
  );

  @override
  PassValidationError validator(String value) {

    return _passwordregex.hasMatch(value) ? null : PassValidationError.invalid;

  }



}
