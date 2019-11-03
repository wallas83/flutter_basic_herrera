

import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();
  SharedPreferences _prefs;
  initPrefs() async{
   this._prefs = await SharedPreferences.getInstance();
  }
  //ningua de estas propiedades se usa

  // bool _colorSecuandario;
  // int _genero;
  // String _nombre;

  //get y set del genero

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero (int valor) {
    _prefs.setInt('genero', valor);
  }


  //get y set del _colorSecuandario

  get colorSecuandario {
    return _prefs.getBool('colorSecuandario') ?? false;
  }

  set colorSecuandario (bool valor) {
    _prefs.setBool('colorSecuandario', valor);
  }

  //get y set del nombre

  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre (String valor) {
    _prefs.setString('nombre', valor);
  }


  //get y set del ultima pagina

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina (String valor) {
    _prefs.setString('ultimaPagina', valor);
  }
}