import 'package:flutter/material.dart';
import 'package:formulario_block/src/models/producto_model.dart';
import 'package:formulario_block/src/providers/productos_provider.dart';
import 'package:formulario_block/src/utils/utils.dart' as utils;
class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formkey = GlobalKey<FormState>();
  ProductModel producto = new ProductModel();
  final productoProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},  
          ),
           IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},  
          )
          
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key:formkey ,
            child: Column(
              children: <Widget>[
            _crearNombre(),
            _crearPrecio(),
            _crearBoton(),
            _crearDisponible()
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: 'Producto'
        ),
        onSaved: (value) => producto.titulo = value,
        validator: (value) {
          if(value.length < 3) {
            return 'ingrese el nombre del producto ';
          } else {
            return null;
          }
        },
    );
 }

 Widget  _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Precio'
        ),
        onSaved: (value) => producto.valor = double.parse(value),
        validator: (value) {
          if(utils.isNumber(value)) {
            return null;

          }else {
            return 'Solo Numeros';
          }
        },
    );
 }

  Widget _crearBoton() {

    return RaisedButton.icon(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );

  }

  void _submit () {

    if(!formkey.currentState.validate()) return;

    formkey.currentState.save();
    print('ok');
    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);
    
      productoProvider.crearProducto(producto);
  }

 Widget  _crearDisponible() {

   return SwitchListTile(
     value: producto.disponible,
     title: Text('Disponible'),
     activeColor: Colors.deepPurple,
     onChanged: (value) => setState((){
        producto.disponible = value;
     }),
   );
 }
 }