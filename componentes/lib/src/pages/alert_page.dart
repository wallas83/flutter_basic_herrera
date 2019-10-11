import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alert'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('mostar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape:  StadiumBorder(),
          onPressed: ()=>_MostarAlerta(context),
        ),

      ),
    );
  }

  void _MostarAlerta(BuildContext context){
    
    showDialog(
      
    context: context,
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('este es el contenido de  la caja de la alerta'),
            FlutterLogo( size: 100.0,),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancelar'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: (){ Navigator.of(context).pop();},
          ),
        ],
      );
    }
    );
  }
}
