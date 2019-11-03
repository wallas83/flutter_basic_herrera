import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_prefs/prefrencias_usuario.dart';
 
void main() async{
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
  }
  
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'preferencias',
      initialRoute:prefs.ultimaPagina,
      routes: {
        HomePage.routename : (BuildContext context) => HomePage(),
        Settingspage.routename : (BuildContext context) => Settingspage()
      },
    );
  }
}