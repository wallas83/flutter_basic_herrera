import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
             Expanded(
               child: _crearImagen()
               )
               ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'tamanho de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck) ? null :(valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }


  Widget _crearCheckbox() {
      // return Checkbox(
      //       value: _bloquearCheck,
      //       onChanged: (valor){
      //           setState(() {
      //             _bloquearCheck = valor;
      //           });
      //       },
      // );
      return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
           _bloquearCheck = valor ;
          });
        },
      );
  }

  Widget _crearSwitch (){
    return SwitchListTile(
       title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
           _bloquearCheck = valor ;
          });
        }
    );
  }




  Widget _crearImagen() {
    return FadeInImage(
      image: NetworkImage(
          'https://cdn.atomix.vg/wp-content/uploads/2015/07/Screen-Shot-2015-07-11-at-12.23.44-PM.png'),
       placeholder: AssetImage("assets/jar-loading.gif"),
       fadeInDuration: Duration(milliseconds: 200),
       width: _valorSlider,
       height: 200,
       fit: BoxFit.contain,
    );
  }

}
