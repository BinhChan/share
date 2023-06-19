import 'dart:async';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc {
final _stateController= StreamController<LoginState>();
Stream <LoginState> get state => _stateController.stream;

// ignore: non_constant_identifier_names
void send (LoginEvent event){
  switch(event){
    case LoginEvent.login:
      _stateController.sink.add(LoginState.loading());

      // ignore: prefer_const_constructors
      Future.delayed(Duration(seconds: 2),(){
      _stateController.sink.add(LoginState.success());
      }
      );
      }
  }


void dispose (){
    _stateController.close();}
}