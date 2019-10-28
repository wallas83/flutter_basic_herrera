import 'package:flutter/material.dart';
import 'package:peliculas/src/model/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

class DataSearch extends SearchDelegate {
  String seleccion;
  final   peliculasProvider = new PeliculasProvider() ;
  
  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Iron Man',
    'Capitan America'
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan America'];
  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones de nuestro appbar
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //crea los resulatados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 200.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //son las sugerencias que aparece cuando la persona escribe
        if(query.isEmpty) {
          return Container();
        }
        return FutureBuilder(
          future: peliculasProvider.buscarPelicula(query),
         // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot <List<Pelicula>> snapshot) {
            
            if(snapshot.hasData) {
                  final peliculas = snapshot.data;                 
                return ListView(
                    children: peliculas.map((pelicula){
                        return ListTile(
                            leading: FadeInImage(
                              image: NetworkImage(pelicula.getPosterImg()),
                              placeholder: AssetImage('assets/img/no-image.jpg'),
                              fit: BoxFit.contain,
                            ),
                            title: Text(pelicula.title),
                              subtitle: Text(pelicula.originalTitle),
                              onTap: () {
                                close(context, null);
                                pelicula.uniqueId = '';
                                Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                              },
                        );
                    }).toList() ,
                );
                } else {
                  return Center(child: CircularProgressIndicator(),);
                }
          },
        );
  }


  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   //son las sugerencias que aparece cuando la persona escribe

  //   final listaSugerida = (query.isEmpty)
  //       ? peliculasRecientes
  //       : peliculas
  //           .where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //           //es vital para que se muestren los resultados en la busqueda
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }
}
