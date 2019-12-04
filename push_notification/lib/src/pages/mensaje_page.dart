import 'package:flutter/material.dart';
class MensajePage extends StatelessWidget {
  const MensajePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mnesaje Page'),
      ),
      body: Center(
        child: Text(arg),
      ),
    );
  }
}