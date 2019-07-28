import 'package:flutter/material.dart'; //importamo la librería material.dart.


/*void main() { //Creamos el métdo principal
  
    runApp( // Esta sentencia hace que se ejecute en primer lugar los siguientes códigos.
        new Center(//Con esto lo primero que hacemos es centrar todo los widget.
            child: new Directionality( //Creamos el widget Directionality y con child anidamos dentro de Center.
              textDirection: TextDirection.ltr, //decimos que el texo va a izquierda.
              child: new Text("hola mundo") //Creamo widget Text para imprimir las palabras hola mundo
          )
        )
    );
}*/
void main() { //Creamos el métdo principal
      runApp( // Esta sentencia hace que se ejecute en primer lugar los siguientes códigos.
        new MaterialApp( //permite una serie de wiched en flutter en materialdisain.
          title: "Mi primera aplicación",
          home: new Scaffold(//este wiches lo que hace es crear un esquema, como encabezado, cuerpo etc...
              appBar: new AppBar(//creamos contenedor de cabezera, donde metemos el texto del título
                  title: new Text("Este es el título"),//aqui va el texto que queremos imprimmir en pantalla
              ),
              body: new Container(//Creamos un contenedor para meter dentro el texto que vamos a mostrar
              child: new Center(//Centramos el texto.
                child: new Text("Este es el texto en cuerpo"),//y este es el texto.
              )  
              ),
          )
        )
      );
}