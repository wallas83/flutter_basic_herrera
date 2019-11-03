import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/prefrencias_usuario.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingspage extends StatefulWidget {
  static final String routename = 'settings';

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  bool _colorSecundario;
  int _genero = 1;
  String _nombre = 'Pedro';
  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();
  @override
  void initState() { 
    super.initState();
    prefs.ultimaPagina = Settingspage.routename;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecuandario;

    _textController = new TextEditingController(text: prefs.nombre);
  }
  

  _setSelectedRadio(int valor) {
     //await prefs.setInt('genro', valor);
     prefs.genero = valor;
    _genero = valor;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('preferencias'),
           backgroundColor: (prefs.colorSecuandario) ? Colors.teal : Colors.blue,
   
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
              
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color Secundario'),
              onChanged: (value) {
                setState(() {

                _colorSecundario = value;
                 prefs.colorSecuandario = value; 
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio
            ),
               RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged:_setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'nombre',
                  helperText: 'nombre de la persona usando el telefono',
                  
                ),
                onChanged: (value){
                  prefs.nombre = value;
                },
              ),
            )
          ],
        ));
  }
}
