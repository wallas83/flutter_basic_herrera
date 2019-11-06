import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessible),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
