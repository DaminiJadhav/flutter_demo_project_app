import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class  LoginFormEvent extends Equatable{
  const LoginFormEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  // TODO: implement stringify
  bool get stringify => super.stringify;
}

class EmailChanged extends LoginFormEvent{
  final String email;

  EmailChanged(@required this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class PasswordChanged extends LoginFormEvent{
  final String password;

  PasswordChanged(@required this.password);

  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class FormSubmitted extends LoginFormEvent{}