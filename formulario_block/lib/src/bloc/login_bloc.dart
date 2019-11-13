import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:formulario_block/src/bloc/validator.dart';

class LoginBloc with Validators{
    //el behaviorSubjet igual hace un broadcast  a todo 
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


//recuperar los datos del stream
 Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
 Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
 

 Stream<bool> get formValidSream  => Observable.combineLatest2(emailStream, passwordStream, (e,p) => true);
 //Insert valores al Stream
 Function(String) get changeEmail    => _emailController.sink.add;
 Function(String) get changePassword => _passwordController.sink.add;

    //Obgtener el ultimo valor utilizado

    String get email     =>   _emailController.value;
    String get password  =>   _passwordController.value;
    


  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
  
}