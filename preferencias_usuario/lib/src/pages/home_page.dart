import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/prefrencias_usuario.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routename = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routename;
    return Scaffold(
      appBar: AppBar(
        title: Text('preferencias de usuarion'),
        backgroundColor: (prefs.colorSecuandario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Cololr secundario: ${prefs.colorSecuandario}'),
          Divider(),
          Text('genero ${prefs.genero}'),
          Divider(),
          Text('nombre de usuario : ${prefs.nombre}'),
          Divider()
        ],
      ),
    );
  }

 
}
