import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      //boton para regresar a la pantalla anterior
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_activity),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      //en el body vamos a crear una tarjeta de visita
      body: ListView(//damos primero un listView para pasar una lista de tarjeta
        padding:EdgeInsets.all(10),//el padding es para dar un espacio interior
        children: <Widget>[//creamos un children y dentro metemos una lista de widget
          _cardTipo1(),//para comodidad cramos un método
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),//para comodidad cramos un método
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),//para comodidad cramos un método
          SizedBox(height: 30.0),
          _cardTipo2(),_cardTipo1(),//para comodidad cramos un método
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
                          
    );
  }
                    
            Widget _cardTipo1() {//este es el método 1
              return Card(//que retornamos un widget Card
              elevation: 10.0,//le damos sombra a la tarjeta
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),//redondeamos los bordes
                child: Column(//que tiene dentro un widget Column
                  children: <Widget>[//y volvemos a crar una  lista de widget
                    ListTile(//que damos widget ListTile
                    leading: Icon(Icons.photo_album, color: Colors.blue),  // y ponemos iconos en la parte derecha
                    title: Text ('Soy el título de esta tarjeta'),//damos un título
                    subtitle: Text('En un lugar de la mancha, cuyo lugar no quiero acordarme, pues al final me acuerdo y es un tostón'), //damos un subtitulo
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,//alineamos los botones en el Row, a la izquierda
                      children: <Widget>[//cramos en el Row una lista de widget
                        FlatButton(//metemos dos botones uno Cancelar y otro ok
                          child: Text('Cancelar'),
                          onPressed:(){},//No le damos función todavía
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed:(){},
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          
            Widget _cardTipo2() {//este es el método 2

            //vamos a cargar una tarjeta con imagen, y mientras mostrará una definida mientras carga la otra
            //todo el contenido de la tarjeta la hemos metido en una variable
            final card = Container(
             //clipBehavior: Clip.antiAlias ,//esta propiedad lo que hace es que nada que este en la tarjeta se salga del borde de la misma, ahora mismo no esta funcionado en flutter
              child: Column(
                children: <Widget>[
                  //este widget lo que hace es gestionar las imágenes mientra se cargan
                  FadeInImage(
                  image: NetworkImage('https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg') ,//damos la dirección de la imagen de internet
                  placeholder: AssetImage('assents/jar-loading.gif'),//el gif que carga mientras entra los datos
                  fadeInDuration: Duration(milliseconds: 200) , //duración del gif
                  height: 300.0,//un alto específico
                  fit: BoxFit.cover ,//como la imagen debe de ocupar el espacio que tiene
                  ),
                  //ESTE ES OTRO MÉTODO PARA MOSTRAR IMÁGENES PERO NO CARGA UN LOGIN MIENTRAS REQUIERE LOS DATOS
                  /*Image(
                    image: NetworkImage('https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg'),
                  ),*/
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text('No tengo idea '))
                ],
              ),
              
              );

              //retornamos los datos de la variable, con este sistema hacemos lo mismo que en el clipBhavior
              return Container(
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),//le damos un borde para darle circular las esquinas
                  child: card ,),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,//le damos el color al contenedor
                  boxShadow: <BoxShadow>[//Creamos una lista de boxShadow, para dar diseño
                    BoxShadow(
                      color: Colors.black26,//blanco con un indice de opacidad de 26
                      blurRadius: 10.0, 
                      spreadRadius:  2.0,//para extender la imagen
                      offset: Offset(2.0,10.0)//posición dentro de la pantalla x o y
                    )
                  ]
                ),
              );


              


            }
}