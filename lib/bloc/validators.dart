import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains('@')){
        sink.add(email);
      } else {
        sink.addError('Enter a valid Email');
      }
    }
  );

  final validatePassword = StreamTransformer.fromHandlers(
    handleData: (password, sink) {
      if(password.lenght>6){
        sink.add(password);
      } else{
        sink.addError('Password must be of atleast 6 charachters');
      }
    }
  );
}