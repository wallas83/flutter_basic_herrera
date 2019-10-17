import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //List<int> _listaNumeros = [10,20,30,40,50,60,70,80,90];
  ScrollController _scrollController = new ScrollController();
  int _ultimoItem = 0;
  bool _isloading = false;
  List<int> _listaNumeros = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _agregar10();
     _scrollController.addListener((){
        //  print('scroll!!!');
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         // _agregar10();
         fetchData();
        }
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
              children: <Widget>[

              _crearLista(),
             _crearLoading()
       
              ],
              )
         
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(

      onRefresh:obtenerPagina ,
          child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
        final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          );

        },
      ),
    );
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }
  void _agregar10(){
    for (var i = 1; i <= 10; i++) {
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future fetchData() async {
      _isloading = true;
      setState(() {});
    final duration = new Duration( seconds: 2);
      return new Timer(duration, respuestaHTTP);
  
  }

  void respuestaHTTP(){
    _isloading = false;
    _scrollController.animateTo(

    _scrollController.position.pixels + 100,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250)
    );
    
    _agregar10();
  }


 Widget _crearLoading() {
  
  if(_isloading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 CircularProgressIndicator()
              ],
            ),
            SizedBox(height: 15.0,)
        ],
      ) ;
      
  } else{
    return Container();
  }
  }

}