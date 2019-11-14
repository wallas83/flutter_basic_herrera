import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:formulario_block/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-c1410.firebaseio.com';

  Future<bool> crearProducto(ProductModel producto) async {
    final url = '$_url/productos.json';

    final resp = await http.post(url, body: productModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);
    return true;
  }
}
