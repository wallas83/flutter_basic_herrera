import 'dart:math';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos()
              ],
            ),
          )
          ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.6),
                end: FractionalOffset(0.0, 1.0),
                colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0)
            ])));

    final cajaRosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0)
              ]))),
    );

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosada)],
    );
  }

  Widget _titulos() {
    final color = TextStyle(color: Colors.white,fontSize: 36.0,fontWeight: FontWeight.bold );
    return SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Clasify transaction',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold ),),
            SizedBox(height: 10.0,),
            Text('Clasify this transaction into a particular Category', style: TextStyle(color: Colors.white,fontSize: 18.0,),)
          ],
        ),
      ),
    );
  }
}
