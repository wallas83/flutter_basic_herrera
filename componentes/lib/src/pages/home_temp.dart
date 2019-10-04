import 'package:flutter/material.dart';
class HomePageTemp extends StatelessWidget {

  final opciones = ['uno','dos','tres','cuatro','cinco','seis','siete','ocho'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COmponenetes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta() ,
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
       final temWidget = ListTile( 
         title: Text(opt),
       );

      lista..add(temWidget)
           ..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta(){
    return  opciones.map((item){
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item + '!'),

              subtitle:Text('CUalquier cosa'),
              leading: Icon(Icons.add_a_photo),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){},
            ),
            Divider()
          ],
        );
    }).toList();
  }

}