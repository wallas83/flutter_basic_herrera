import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/model/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = 'a1fc912350683ec562080e542a554ec1';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;

  List<Pelicula> _populares = new List();

  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void disposeStream() {
    _popularesStream?.close();
  }
  //modificaion
  //String _page = '1';

  Future<List<Pelicula>> getRespuesta(url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    //print(peliculas.items[0].title);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    // final resp = await http.get(url);
    // final decodedData = json.decode(resp.body);

    // //print(decodedData);
    // final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    // //print(peliculas.items[0].title);
    // return peliculas.items;
    return await getRespuesta(url);
  }

  Future<List<Pelicula>> getPopular() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    // final resp = await http.get(url);
    // final decodedData = json.decode(resp.body);
    // print("asdasd $decodedData");
    // final peliculasPopulares =
    //     new Peliculas.fromJsonList(decodedData['results']);
    // return peliculasPopulares.items;

    //llamando al stream

    final resp = await getRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
   
    return resp;
  }
}
