import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//libreria para que detecte el idioma del sistema

//Nuestras librerías propias
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/routes/routes.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //librería para que localice nuestro idioma del sistema
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES'), //Español
        const Locale('en', 'US'),//Ingles
      ],
      initialRoute: '/', //la ruta inicial es ..
      routes: getApplicationRoutes(),
      
      //estamos creando una ruta dinamica, en función de un parametro
      onGenerateRoute: ( RouteSettings settings){
        return MaterialPageRoute (
          builder: (BuildContext context)=> AlertPage());
      },
    );
  }
}