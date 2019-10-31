import 'package:flutter/material.dart';
import 'package:qr_reader/src/pages/direcciones_page.dart';
import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/mapas_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
     initialRoute: 'home',

     routes: {
       'home'      : (BuildContext context) => HomePage(),
       //'mapa'      : (BuildContext context) => MapasPage(),
       //'direccion' :  (BuildContext context) => DireccionPage()
     },
     theme: ThemeData(
       primaryColor: Colors.redAccent
     ),
    );
  }
}