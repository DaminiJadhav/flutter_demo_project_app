import 'dart:async';

import 'dart:math';

class Validators{

  var emailValidator=StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
//
//      if(email==null){
//        sink.addError("fill field 1");
//      }else
        if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError('Email is not valid');
      }
    }
  );

  var passwordValidator=StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if(password.length>4){
          sink.add(password);
        }else{
          sink.addError('Password lenget should be > 4 chars.');
        }
      }
  );
}