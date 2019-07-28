import 'package:flutter/material.dart';

import 'package:pelis/src/pages/home_page.dart';

//El snipper para que se cree automaticamente es "mateapp" 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => HomePage(),
      },
    );
  }
}