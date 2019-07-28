import 'package:flutter/material.dart';

//creamos la clase StatefulWidget
class ContadorPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _ContadorPageState(); //retorna una nueva instancia de la clase que creamos un poco mas abajo
  }
}
/* es lo mismo que escribirlos en corto de esta manera
@override
createState() => _ContadorPageState();*/


//vamos a crear la clase para saber el estado del Statefulwidget, al poner el guión bajo solo se puede utilizar en este archivo
class _ContadorPageState extends State<ContadorPage> { //se extiende a otra clase llamada State, se debe de especificar el tipo de widget
  
 final TextStyle _estiloTexto = new TextStyle(fontSize: 25); //variable que hemos creado para dar estilo
 int _conteo = 0; // variable para dar datos al contador

@override //con esto lo que hacemos es sobreescribir el método build que trae por defecto StatefulWidget, por el nuestro.
  
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
              Text('Número de taps', style: _estiloTexto), //Widget Text, y le damos el estilo que hemos creado
              Text('$_conteo', style: _estiloTexto), //Otro Widget Text, usamos la variable conteo y le damos el estilo que hemos creado
            ],
          ),
      ),
      //vamos a colocar varios botones, lo primero que necesito es un Row
      floatingActionButton: _crearBotones(), //llamamos a un metodo que hemos creado (texto verde)
    );
  }
        /*HEMOS CONSEGIDO SACAR TODO EL CÓDIGO DEL SCAFFOLD*/
        Widget _crearBotones(){
          return Row(//creamos un Row es una lista vertical
            mainAxisAlignment: MainAxisAlignment.end, //alineamos al final izquierda si lo queremos a la derecha sería al principio.
            children: <Widget>[//creamos una lista para meter todos los botones
            SizedBox(width: 30,), //le damos la separación respecto al principio del Row
            FloatingActionButton (child: Icon(Icons.exposure_zero), onPressed: _reset,), //boton "0" de la derecha que es el primer widget
            Expanded(child: SizedBox(),), //expande a todo el ancho posible del Row, ojo te obliga  a agregar un SizedBox (texto azul).
            FloatingActionButton (child: Icon(Icons.remove), onPressed: _sustraer,),
            SizedBox(width: 5.0,),
            FloatingActionButton (child: Icon(Icons.add), onPressed: _agregar/*()*/,), //OJO NO SE PONE PARENTESIS POR QUE SINO SE EJECUTARÍA AUTOMÁTICAMENTE
          ],);
          }

    void _agregar (){
      
      setState(() => _conteo++);
      /* es la forma extendida de escribir pero es lo mismo
      setState(() {
        _conteo++;
      });  */
    }
    void _sustraer(){
      setState(() => _conteo--);
    }
    void _reset (){
      setState(() {
        _conteo = 0;
      });
    }
}


