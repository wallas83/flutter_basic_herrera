import 'package:flutter/material.dart';
import 'package:formulario_block/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  //singleton
  static Provider _instancia;
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider.internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }

  final loginBloc = LoginBloc();

  Provider.internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }
}
