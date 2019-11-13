import 'package:flutter/material.dart';
import 'package:formulario_block/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessible),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text('Home')
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.adb),
      backgroundColor: Colors.deepPurple,
      onPressed:  () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
