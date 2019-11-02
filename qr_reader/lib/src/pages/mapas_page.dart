import 'package:flutter/material.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:qr_reader/src/pages/scans_bloc.dart';
import 'package:qr_reader/src/utils/utils.dart'as utils;

class MapasPage extends StatelessWidget {
  final scansBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,

      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No hay Informacion'),
          );
        }

        
        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction)  =>  scansBloc.borrarScan(scans[index].id) ,
             //   onDismissed: (direction)  =>  DBProvider.db.deleteAll() ,
                
                  key: UniqueKey(),
                  background:Container(color: Colors.red),
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_queue,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(scans[index].valor),
                    subtitle: Text('ID:${scans[index].id}'),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      
                    ),
                    onTap: () => utils.abrirScan(context,scans[index]),
                  ),
                ));
            
      },
      
    );
  }
  
}
