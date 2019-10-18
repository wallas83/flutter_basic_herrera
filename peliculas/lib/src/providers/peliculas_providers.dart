import 'dart:convert';

import 'package:peliculas/src/model/pelicula_model.dart';
import 'package:http/http.dart' as http;
class PeliculasProvider {

  String _apiKey = 'a1fc912350683ec562080e542a554ec1';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future <List<Pelicula>> getEnCines()async {

    final url = Uri.https(_url,'3/movie/now_playing', {
      'api_key'  : _apiKey,
      'language' : _language
    });
   final resp = await http.get(url);
   final decodedData = json.decode(resp.body);

   print(decodedData);

    return [];
  }
}