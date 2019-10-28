import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas/src/model/pelicula_model.dart';
class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;
 
  MovieHorizontal({ @required this.peliculas, @required this.siguientePagina });
  final _pageController = new PageController(
            initialPage: 1,
            viewportFraction: 0.3 );
  @override
  Widget build(BuildContext context) {
    final _screanSize = MediaQuery.of(context).size;
    
    _pageController.addListener((){
      if( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });
    return Container(
        height: _screanSize.height * 0.23,
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
          itemBuilder: (BuildContext context, int index) => _tarjetaWidget(peliculas[index], context),
          //children: _tarjetas(context),
        ),
    );
  }

  Widget _tarjetaWidget ( Pelicula pelicula,BuildContext context){

    pelicula.uniqueId = "${pelicula.id}-movieHorizontal";
    
    final tarjeta = Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: pelicula.uniqueId,
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                     child: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 160.0,
                  ),
                ),
              ),

              SizedBox(height: 5.0,),
              Text(pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,)
            ],
          ),
        );

        return GestureDetector(
            child: tarjeta,
            onTap: (){
              Navigator.pushNamed(context, 'detalle', arguments: pelicula);
            },
        );
  }

  // List<Widget> _tarjetas(BuildContext context) {
 
  //   return peliculas.map((pelicula) {
  //       return Container(
  //         margin: EdgeInsets.only(right: 15.0),
  //         child: Column(
  //           children: <Widget>[
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(20.0),
  //                  child: FadeInImage(
  //                 image: NetworkImage(pelicula.getPosterImg()),
  //                 placeholder: AssetImage('assets/img/no-image.jpg'),
  //                 fit: BoxFit.cover,
  //                 height: 160.0,
  //               ),
  //             ),
  //             SizedBox(height: 5.0,),
  //             Text(pelicula.title,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,)
  //           ],
  //         ),
  //       );
  //   }).toList();
  // }
}