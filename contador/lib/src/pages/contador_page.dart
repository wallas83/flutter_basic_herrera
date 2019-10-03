import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 20.0);
  int _contador = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('titulo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'click here!!',
                style: _estiloTexto,
              ),
              Text(
                '$_contador',
                style: _estiloTexto,
              )
            ],
          ),
        ),

        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        
        FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _contador = 0;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _contador++;
                });
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  _contador--;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
