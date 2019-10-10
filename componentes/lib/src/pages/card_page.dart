import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[_cardTipo1()],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('titulo de esta tarjeta'),
            subtitle: Text(
                'descrpcion de una tarjeta que se quiere mostar para hacer las pruebas descrpcion de una tarjeta que se quiere mostar para hacer las pruebas '),
              
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }
}
