import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paquetes/clases/pais.dart';
import 'package:paquetes/clases/request_respuesta.dart';

void getReq() {
  final url = 'https://reqres.in/api/users?page=2';
  http.get(url).then((res) {
    final resReqRes = reqResRespuestaFromJson(res.body);

    print('page: ${resReqRes.page}');
    print('per-page: ${resReqRes.perPage}');
    print('ULTIMO ID: ${resReqRes.data[2].id}');
  });
}

void getPais() {
  final url = 'https://restcountries.eu/rest/v2/alpha/col';
  http.get(url).then((res) {
    final col = paisFromJson(res.body);

    print('==========================');
    print('Pais: ${col.name}');
    print('poblacion: ${col.population}');
    print('Fronteras');
    col.borders.forEach((f) => print('   $f') );
    print('lenguaje: ${col.languages[0].nativeName}');
    print('latitud: ${col.latlng[0]}');
    print('longitud: ${col.latlng[1]}');
    print('Moneda: ${col.currencies[0].name}');
    print('Bandera: ${col.flag}');
    print('==========================');
  });
}
