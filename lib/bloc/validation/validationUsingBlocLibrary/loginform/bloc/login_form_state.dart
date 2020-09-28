import 'package:equatable/equatable.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/Email.dart';
import 'package:formz/formz.dart';

import '../password.dart';

class LoginFormState extends Equatable{

  final Email email;
  final Password password;
  final FormzStatus status;


  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });


   LoginFormState copyWith({
     Email email,
     Password password,
     FormzStatus status
  }){
     return LoginFormState(
       email: email?? this.email,
       password: password??this.password,
       status: status??this.status
     );
   }

  @override
  // TODO: implement props
  List<Object> get props => [email,password,status];

  @override
  // TODO: implement stringify
  bool get stringify => super.stringify;

}