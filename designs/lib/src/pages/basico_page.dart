import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  const BasicoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            _crearImagen(),
          //  SizedBox(height: 30.0,),
            _tituloBasico(),
            _iconsTema(),
           // SizedBox(height: 12.0),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto()
          ],
        ),
      ),
    );
  }

  Widget _tituloBasico() {
    return SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "whatEver yo want Title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Subtitlulo del titulo",
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
            SizedBox(
              width: 180,
            ),
            Icon(Icons.star,color: Colors.red,),
            Text("41")
          ],
        ),
      ),
    );
  }
  Widget _crearImagen() {
    return  Container(
      width: double.infinity,
          child: FadeInImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              placeholder: AssetImage('assets/img/no-image-icon.png'),
              fit: BoxFit.cover,
              height: 250,
            ),
    );
  }

  Widget _iconsTema() {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _nombres(Icons.call, "call"),
            _nombres(Icons.settings_backup_restore, "Route"),
            _nombres(Icons.share, "Share")
          ],
        ),
      ),
    );
  }

  Widget _nombres(IconData icono, String texto) {
    return Column(
      children: <Widget>[Icon(icono,color: Colors.blueAccent,), Text(texto,style: TextStyle(color: Colors.blueAccent),)],
    );
  }
  Widget _crearTexto(){
    return SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas , las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.", textAlign: TextAlign.justify,),
            ),
    );
  }
}
