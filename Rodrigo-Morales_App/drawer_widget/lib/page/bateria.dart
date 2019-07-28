import 'package:flutter/material.dart';


class Bateria extends StatelessWidget {
  static const String routeName = "/bateria";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Batería"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Estado de la batería"),
        ),
      ),
    );
  }
}