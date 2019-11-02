import 'package:flutter/material.dart';
import 'package:qr_reader/src/model/scan_model.dart';
import 'package:qr_reader/src/pages/direcciones_page.dart';
import 'package:qr_reader/src/pages/mapas_page.dart';
import 'package:qr_reader/src/pages/scans_bloc.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarScanTODOS,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBotomNavigationbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearFloatingButtom(),
    );
  }

  Widget _crearBotomNavigationbar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones'))
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionPage();

      default:
        return MapasPage();
    }
  }

  Widget _crearFloatingButtom() {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: _scanQR,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _scanQR() async {
    //https://www.google.com/
    //geo:-16.502047, -68.1313,500
    String futureString = 'https://www.google.com/';

    //  try {
    //     futureString = await new QRCodeReader().scan();
    //  } catch (e) {
    //       futureString = e.toString();
    //  }
    // print(' futureString $futureString');

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
        scansBloc.agregarScan(scan);
       }
    
  }
}
