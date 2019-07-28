import 'package:flutter/material.dart';


      /*nombre*/      /*este es un widget*/
class HomePage extends StatelessWidget{ //este tipo de widget no es modificlable
 
 final TextStyle estiloTexto = new TextStyle(fontSize: 25); //variable que hemos creado para dar estilo no modificlable
 final int conteo = 10; // variable para dar datos al contador
  
  @override //con esto lo que hacemos es sobreescribir el método build que trae por defecto StatelessWidget, por el nuestro.
  
         /*hay que definir un método*/
  Widget build(BuildContext context) {
              /*este es el argumento context, contiene la información del árbol de widget*/
    return Scaffold( /* y ahora retornamo un widget un Scaffold, que es una extructura principal de las app cabecera, cuerpo... */
      appBar: AppBar( /* dentro tiene la propiedad AppBar (clase) que es una cabecera app  */
        title: Text('Título'),/* y dentro de AppBar tiene la propiedad title, y dentro el widget text */
        centerTitle: true, //propiedad para central el Text
        elevation: 15.0, //propiedad para hacer una sombra a AppBar
      ),
      body: Center(/* dentro tiene la propiedad body (clase) que es el cuerpo de la app  */
          child: Column( 
            /*Child es otro widget que tiene dentro de Center, y que a la vez tiene el widget Column*/
            mainAxisAlignment: MainAxisAlignment.center, //propiedad de Column esto para centrar
            children: <Widget>[ //este es un widget de Column que dentro tiene una listas de widget que podemos ir agregando
              Text('Número de Clicks', style: estiloTexto), //Widget Text, y le damos el estilo que hemos creado
              Text('$conteo', style: estiloTexto), //Otro Widget Text, usamos la variable conteo y le damos el estilo que hemos creado
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //con esto posicionamos el botón donde consideremos
      floatingActionButton: FloatingActionButton( /* dentro tiene la propiedad floatingActionButton (clase) 
      que es un botón de material design para la app, pero esta propiedad requiere un onPressed siempre*/
        child: Icon(Icons.add_box),/* dentro tiene la propiedad child (clase) que podemos introducir el widget Icon */
        onPressed: ( ) { //esta es la propiedad par dar funcionalidad al botón, y es siempre requerida
          print('esto esta funcionando'); //esto es la acción
        },
      ),
      
    );
  }
}