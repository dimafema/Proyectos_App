//Estos son los paquetes que debemos importar como mínimo para que funciones la app, son librería que ya existen en flutter.

import 'package:flutter/material.dart';


//Nuestras clases
import 'package:contador/src/pages/contador_page.dart';


    /*nombre*/      /*este es un widget*/
class MyApp extends StatelessWidget { //este tipo de widget no es modificlable

@override //con esto lo que hacemos es sobreescribir el método build que trae por defecto StatelessWidget, por el nuestro.
         /*hay que definir un método*/
  Widget build( BuildContext context ){
              /*este es el argumento context, contiene la información del árbol de widget*/
    return MaterialApp( /* y ahora retornamo un widget en este caso MaterialApp*/
      debugShowCheckedModeBanner: false, //para quitar el banner de los emuladores.
      home: Center( /*uno de sus argumentos de MaterialApp es el home, que también es un widget */
            /*y Center es otro tipo de widget */
        child:ContadorPage(),//dentro metemos otro widget que en este caso hemos creado "ContadorPage" (texto azuz)
      ),
    );
  
  }
  }