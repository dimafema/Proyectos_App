import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context), //llamamos a la función _mostrarAlert (texto verde) y le damos un argumento "context" (texto blando)
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
  //creamos el método para mostrar el mensaje de alerta
  void _mostrarAlert(BuildContext context){
    //El método que se utiliza es el siguiente
    showDialog(
      context: context,
      barrierDismissible: true, //este comando hace que si clicamos fuera de la alerta se cierra, 
      builder: (context) {//le damos como argumento el context, y regresamos un widget
        return AlertDialog (//y aquí configuramos la configuración de lo que vamos a mostrar
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),//redondeamos los bordes
        title: Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min ,//le decimos que la columna se adapet al contenido del texto para que no se extienda.
          children: <Widget>[
            Text('Este es el contenido de la alerta'),
            FlutterLogo(size: 100.0),//le ponemos el logo de flutter
            ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),//con esta función cerramos la alerta cuando pulsemos el boton, forma resumida
          ),
          FlatButton(
            child: Text('Ok'),
            onPressed: (){
              Navigator.of(context).pop();//igual forma extendida
            },
          )
        ],
        );
      }
    );


  }
}




