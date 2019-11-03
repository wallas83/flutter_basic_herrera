import 'dart:async';

import 'package:qr_reader/src/block/validator.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:qr_reader/src/provider/db_provider.dart';

class ScansBloc with Validators {

  static final ScansBloc _singleton =  new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal(){
      //obtener los scans de la base de datos 
      obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();
 
  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

  void dispose() { 
      _scansController?.close();   
    }


    obtenerScans() async{
      //se adiciona los datos al sink
      _scansController.sink.add(await DBProvider.db.getTodosScans());
    }

    agregarScan(ScanModel scan)async {
      await DBProvider.db.nuevoScan(scan);
      obtenerScans();
    }
    borrarScan(int id) async{
     await  DBProvider.db.deleteScan(id);
     obtenerScans();
    }

    borrarScanTODOS () async{
          await DBProvider.db.deleteAll();
          obtenerScans();
    }
}

