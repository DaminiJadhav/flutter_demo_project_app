import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/Email.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/bloc/login_form_event.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/bloc/login_form_state.dart';
import 'package:formz/formz.dart';

import 'bloc/login_form_bloc.dart';

class LoginFormMainPage extends StatefulWidget {
  @override
  _LoginFormMainPageState createState() => _LoginFormMainPageState();
}

class _LoginFormMainPageState extends State<LoginFormMainPage> {

  TextEditingController usernamecontroller=new TextEditingController();
  TextEditingController passcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc,LoginFormState>(
      listener: (context,state){
          if(state.status.isSubmissionSuccess){
            Scaffold.of(context).hideCurrentSnackBar();
            showDialog(
              context: context,
              builder: (_) => SuccessDialog(),
            );
          }
          if(state.status.isSubmissionInProgress){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Submitting'),));
          }
      },
      child: Container(
       child: Column(
        children: <Widget>[
          EmailInput(),
          PasswordInput(),
          SubmitButton(),

        ],
      ),
    ),
    );
  }
}


class EmailInput extends StatelessWidget {

  TextEditingController usernamecontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc,LoginFormState>(
      cubit: BlocProvider.of<LoginFormBloc>(context),
      buildWhen: (previous,current){
        print(previous.email);
        print(current.email);
        return previous.email!=current.email;
      },
      builder: (context,state){
        return TextFormField(
//          controller: usernamecontroller,
          initialValue: state.email.value,
          decoration: InputDecoration(
            hintText: 'Username',
            errorText: state.email.invalid ? 'Invalid email' : null,
          ),
          onChanged: (value){
            context.bloc<LoginFormBloc>().add(EmailChanged(value));
          },
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  TextEditingController passcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc,LoginFormState>(
      cubit: BlocProvider.of<LoginFormBloc>(context),
      buildWhen: (previous,current){
        print(previous.password);
        print(current.password);
        return previous.password!=current.password;
      },
      builder: (context,state){
        return TextFormField(
//          controller: passcontroller,
          initialValue: state.password.value,
          decoration: InputDecoration(
              hintText: 'Password',
              errorText: state.password.invalid ? 'Invalid password' : null,
          ),
          obscureText: true,
          onChanged: (value){
            context.bloc<LoginFormBloc>().add(PasswordChanged(value));
          },
        );
      },
    );
  }
}


class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc,LoginFormState>(
      cubit: BlocProvider.of<LoginFormBloc>(context),
      buildWhen: (previous,current){
        return previous.status!=current.status;
      },
      builder: (context,state){
        return RaisedButton(
          child: Text('Submit'),
          onPressed: state.status.isValidated ? (){
            return context.bloc<LoginFormBloc>().add(FormSubmitted());
          } : null,
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.info),
                Flexible(
                  child: Text('Form submitted successfully'),
                )
              ],
            ),
            RaisedButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.of(context).pop();

              },
            )
          ],
        ),
      ),
    );
  }
}


