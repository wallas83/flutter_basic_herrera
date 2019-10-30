import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas/src/pages/botones_page.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
     statusBarIconBrightness: Brightness.light
    )
        
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'Peliculas',
          initialRoute: 'botones',
          routes: {
            '/'       : (BuildContext context) => HomePage(),
            'detalle' : (BuildContext context) => PeliculaDetalle(),
            'botones' : (BuildContext context) => BotonesPage()
            
          },
    );
  }
}
