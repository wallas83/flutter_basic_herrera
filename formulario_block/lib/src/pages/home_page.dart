import 'package:flutter/material.dart';
import 'package:formulario_block/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessible),
            onPressed: () {},
          )
        ],
        title: Text('Home')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('email : ${bloc.email}'),
            Divider(),
            Text('password ${bloc.password}')
          ],
        ),
      ),
    );
  }
}
