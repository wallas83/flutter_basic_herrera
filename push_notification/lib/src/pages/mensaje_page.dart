import 'package:flutter/material.dart';
class MensajePage extends StatelessWidget {
  const MensajePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mnesaje Page'),
      ),
      body: Center(
        child: Text('Argumento'),
      ),
    );
  }
}