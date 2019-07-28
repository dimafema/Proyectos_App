

import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

//este es el controlador de lista
ScrollController _scrollController = new ScrollController(); //variable ScrollController
//siempre esta escuchando, y si no desechamo, va sumando siempre listas.
List<int> _listaNumero = new List(); //creamos una lista con valor null
int _ultimoItem = 0; //damos valor 0
bool _isLoading = false;//damos valor falso

//metodo initState
@override //es un método que no regresa nada
  void initState() {
    super.initState();//hace referencia a la clase state
        _agregar10();//cargamos 10 elementos
        //creamos un método para agregar en la lista, cuando llegue al final de la lista que hemos cargado
        _scrollController.addListener(() {//
          //Cuando el scrollControles su numero de pixeles sean igual a maximoScrollExtent es el largo máximo entonces se dispara el método
          if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
         //
         fetchData();//llamamos al método
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      
      body: Stack(//el estac apila los widget uno encima de otro
        children: <Widget>[
             _crearLista(),//creamos una lista
             _crearLoading(),//creamos u loiding
        ],
      )
    );
        }
      
      //craamos el elemento lista
       Widget _crearLista() {
          return RefreshIndicator(//Envolvemos el widget en este para hacer un pull to refresh
            onRefresh: obtenerPagina1,//llamamos al método
            child: ListView.builder(
              controller: _scrollController,//introducer valor al scroll con la variable scrollController
              itemCount: _listaNumero.length, //primero leemos la cantidad de elementos que tenemos en la lista
              itemBuilder: (BuildContext context, int index)/*vemos en el parametros que lea los índice de la lista*/{
                final imagen = _listaNumero[index];
                return FadeInImage(
                  image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
                  placeholder: AssetImage('assents/jar-loading.gif')
                ,);
              }, //Como siempre despues llamamos para ver la forma como se va ha dibujar el elemento, (ya que es un builder)
            ),
          );
       }
        //si arrastramos hacia arriba se cargan 10 imagenes nuevas esto se llama Pull to fefresh
       Future<Null> obtenerPagina1() async {
         final duration = new Duration(seconds: 2);//sumulamos una petición http
         new Timer(duration, (){ //cramos el Timer
           //cuando pase los dos segundo
           _listaNumero.clear(); //purgamos las imagenes la dejamos a 0
           _ultimoItem++; //sumamos unos a la variable
           _agregar10();//cargue 10 imagenes
         });
         return Future.delayed(duration);
       }


       void _agregar10() {
         //si el valor de i que es 1 si es menor de 10 sigue hasta que llegue a 10
         for (var i = 1; i<10; i++){
           _ultimoItem++;//el valor que empieza es 0
           _listaNumero.add(_ultimoItem);//es una variable, de lista que he creado arriba, y le añadimos el valor de _ultimoItem

           setState(() {});//redibujamos el widget
         }
       }
        //Creamos un metodo Future, para recopilar la información antes de proceder
       Future<Null> fetchData() async {
         //estamos simulando un loading
         _isLoading=true;
         setState(() {});
         //creamos una demora para simular el loading
        final duration = new Duration(seconds: 2);//nos la pide el Timer
        //este método lo tenemos que importar de la librerí de Dart
        return new Timer (duration, respuestaHTTP);//no se le pone los paréntesis  por que si no se ejecuta al instante
       }
        //una vez cargado pasamos a este método, que tambien nos la pide el Timer
       void respuestaHTTP(){
         _isLoading = false;
          //nos avisa que hay mas registro, con el efecto que cramos a continuación
          _scrollController.animateTo(//que se anime el scroll
            _scrollController.position.pixels + 100,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 250) //tiempor que tarda en hacer esta función.
          );

        _agregar10(); //llamamos al método
       }
       //esto es para descargar la lista del ScrollController cuando salimos de la página
      @override
       void dispose(){
         super.dispose();
         _scrollController.dispose();
       }
      
      
      //Este Widget crear un loadin
       Widget _crearLoading(){
         if (_isLoading){//si esta cargando
           return Column(//me devuelve una columna, con todo lo que lleva dentro
             //le damos diseño
             mainAxisSize: MainAxisSize.max,//el ancho máximo
             mainAxisAlignment: MainAxisAlignment.end , //que este al final
             children: <Widget>[
                Row(//
                  mainAxisAlignment: MainAxisAlignment.center,//detro del Row, lo centramos
                  children: <Widget>[
                    CircularProgressIndicator(),//le damos un indicador circular, es un circulo dando vueltas
                  ],
                ),
               SizedBox(height: 15.0,) //separación por abajo de la pantalla.
             ],
           );
         }else{//sino un contenedor vacío
           return Container();
         }
       }

}