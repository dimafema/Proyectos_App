import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

//creamos variables de inicio
double _width                       = 50.0;
double _height                      = 50.0;
Color _color                        = Colors.pink;
BorderRadiusGeometry _borderRadius  = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        ),
        body: Center(
          
          //cramos un animater container
          child: AnimatedContainer(
            duration: Duration(seconds: 1),//esta propiedad es requrida en un AnimatedContainer
            curve: Curves.fastOutSlowIn,  //son movimientos predeterminados para uso, los ejemplos están en la documentación de flutter.io
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,//llamamos al método  _cambiarForma para modificar los parametros de la variables
      ),
      
    );
  }
 //cramos este método para cambiar los parámetros de las variables
  void _cambiarForma() {
    final random = Random();//creamos el objeto random que nos sirve para coger parametros aleatorias
    setState(() {
    _width  = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _color  = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1);
    _borderRadius =BorderRadius.circular(random.nextInt(100).toDouble());
    });

  }
}