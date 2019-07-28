import 'package:flutter/material.dart';

//los slaider es una linea con un punto que se puede deslazar cororriendo por el contenido de la app
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100.0; //valor inicial de la variable _valorSlider
  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slaider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child:Column(
          children: <Widget>[
            _crearSlider(),//creamos el widget _crearSlide (texto verde)
            _checkBox(),//creamos el widget checkBox, caja de marcación
            _crearSwitch(),//Creamos un widget Switch
            Expanded(//cramos otro widget para la imagen, que esta envuelto en un Widget "Expanded"
            child: _crearImagen()
           )  
          ],
        ),
      ) 
                 );
              }
                        
          Widget _crearSlider() {
                      //retorna un Slider
              return Slider(
              activeColor: Colors.indigoAccent,
              label: 'tamaño de la imagen', //ponemos una galleta mensaje con el texto
            //divisions: 20, //la liena la divide en puntos
              value: _valorSlider, //su estado inicial tiene que estar dentro del minimo y máximo
              min: 10,
              max: 400,
              onChanged: (_bloquearCheck)? null : /*con este código evaluamos si "_cloquearCheck" (texto blanco) es diferente a null entonces dar:*/(valor ){//le damos el parámetro valor
                    setState(() {//le damos un setState por que se tiene que ir redibujando cada vez que lo movamos
                          _valorSlider = valor;//al argumento valor le damos los datos de la variable _valorSlider
                    });
                             
              },
            );
          }
          
          //creamos un CheckboxListTile
          Widget  _checkBox() {
          return CheckboxListTile(
              title: Text('Bloquear Slider con checkBox'),//le damos título
              value: _bloquearCheck,//valor inicial, con la variable que hemos creado arriba
              onChanged: (valor){
                setState(() {//redibujamos cada vez que demos vamos
                   _bloquearCheck = valor;//y le damos los parámetros de la variable que hemos creado
                });
              },
          );
          }
          //Creamos un SwitchLisTile
          Widget _crearSwitch(){
            return SwitchListTile(//este tiene los mismos parámetros que el checkboxListTile
              title: Text('Bloquear Slider con Switch'),
              value: _bloquearCheck,
              onChanged: (valor){
                setState(() {
                   _bloquearCheck = valor;
                });
              },
          );
          }


          Widget  _crearImagen() {
              return Image(
                image: NetworkImage('https://cdn.pixabay.com/photo/2012/04/24/11/39/copyright-free-39515_960_720.png'),
                width: _valorSlider, //le damos el valor de slaider
                fit: BoxFit.contain, //esto para que la imagen se adapte al container y no se salga de el 
              );
              }

          


          
}