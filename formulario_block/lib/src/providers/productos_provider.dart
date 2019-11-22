import 'dart:convert';
import 'dart:io';

import 'package:formulario_block/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:formulario_block/src/models/producto_model.dart';

import 'package:mime_type/mime_type.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-c1410.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductModel producto) async {
    final url = '$_url/productos.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: productModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);
    return true;
  }

  Future<List<ProductModel>> cargarProductos() async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<ProductModel> productos = new List();

    if (decodeData == null) return [];
    if(decodeData['error'] != null) return [];

    print("toda la data del decodedData $decodeData");

    decodeData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;
      print(id);

      productos.add(prodTemp);
    });
    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

  Future<bool>  editarProducto( ProductModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    //el put hace una modificaion a la base de datos 
    final resp = await http.put(url, body: productModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    
    return true;
  }

  Future<String> subirImagen(File imagen) async {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/wallas/image/upload?upload_preset=dl1pom9x');
      final mineType = mime(imagen.path).split('/');

      final imageUploadRequest = http.MultipartRequest(
        'POST',
         url
      );
      final file = await http.MultipartFile.fromPath(
        'file', imagen.path,
        contentType: MediaType(mineType[0], mineType[1])
        ); 
        imageUploadRequest.files.add(file);
        final streamedResponse = await imageUploadRequest.send();
       
       final resp = await http.Response.fromStream(streamedResponse);

       if(resp.statusCode != 200 && resp.statusCode != 201) {
         print('algo salio mal');
         print(resp.body);
         return null;
       }

       final respData = json.decode(resp.body);
       print(respData);

       return respData['secure_url'];

  }
}
