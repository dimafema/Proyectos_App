import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[//lista de widget
        Container(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2012/04/24/11/39/copyright-free-39515_960_720.png'),
            radius: 25.0,
          ),
        ),
        Container(//creamos un container
          margin: EdgeInsets.only(right: 10.0),//al container le damos margen a la derecha
          child: CircleAvatar(//con este widget ponemos el circulo que se encuentra arriba a la derecha del appBar
            child: Text('SL') ,
            backgroundColor: Colors.brown,
          ),
        )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://cdn.pixabay.com/photo/2012/04/24/11/39/copyright-free-39515_960_720.png'),
          placeholder: AssetImage('assents/jar-loading.gir'),
          fadeInDuration: Duration(milliseconds: 200) ,
        ),
      ),
      //boton para regresar a la pantalla anterior
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_activity),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      
    );
  }
}


