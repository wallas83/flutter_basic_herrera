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
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    
    return Card(
      elevation: 5.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      
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
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    
    return Card(
    
    clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_yTz2PsClxAq0HAamgOFHwfnui3f2WXTKbg4hQcAZvhxZoqqN'),
            placeholder:AssetImage("assets/jar-loading.gif") ,
            fadeInDuration: Duration(milliseconds: 200 ),
            height: 250,
            fit: BoxFit.fill,
          ),

          // Image(
          //   image: NetworkImage(
          //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_yTz2PsClxAq0HAamgOFHwfnui3f2WXTKbg4hQcAZvhxZoqqN'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo nada que poner '),
          )
        ],
      ),
    );
  }
}
