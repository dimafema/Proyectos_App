import 'package:flutter/material.dart';
import 'package:drawer_widget/page/home.dart';
import 'package:drawer_widget/page/settings.dart';
import 'package:drawer_widget/page/bateria.dart';

void main() {
  runApp(new MaterialApp(
   home: Home(),
   routes: <String, WidgetBuilder>{
       Settings.routeName: (BuildContext context) => new Settings(),
       Bateria.routeName: (BuildContext context) => new Bateria(),
       }
     ));
   }
  

