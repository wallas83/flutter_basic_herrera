
import 'package:flutter/material.dart';

//imports what i do 
//import 'package:contador/src/pages/home_page.dart';
import 'package:contador/src/pages/contador_page.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Center(child:ContadorPage()),


      

    );
  }
}