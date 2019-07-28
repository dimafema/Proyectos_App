import 'package:flutter/material.dart';


import 'package:pelis/src/widgets/card_swiper_widget.dart';
import 'package:pelis/src/providers/peliculas_provider.dart';
import 'package:pelis/src/widgets/movie_horizontal.dart';

//el snipper para crear el StatelessWidget es "stless"
class HomePage extends StatelessWidget {
  //Creamos una variable y llamo al método PeliculasProvider que esta en el archivo "peliculas_provider.dart"
    final peliculasProvider = new PeliculasProvider();
  
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title:  Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body:Container(   //SafeArea(este es un widget para evitar el nocht, (el hueco que tienen los nuevos dispositivos de pantalla completa para las cámaras)
                        //se encarga de colocar las cosas donde se puede en la pantalla
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//para hacer espacio entre los dos tarjeta
        children: <Widget>[
          _swiperTarjetas(),//Creamos las tarjetas grandes
          _footert(context) //Creamos el método de las tarjetas pequeñas
                  ],
                 ),
               ),
                
              );
            }
          
          
            //Swiper es un tipo de tarjeta grandes de apariencia muy moderna, 
            Widget _swiperTarjetas(){
              return FutureBuilder(//creamos un FutureBuilder, 
                future: peliculasProvider.getEnCines(), //regresamos el Future que tenemos en el archivo peliculas_provider.dart
                builder: (BuildContext context, AsyncSnapshot<List>snapshot) {//retornamo una lista dynamic
          
                  if (snapshot.hasData)/*si el snapshot tiene dato entonces retorna los datos del snapshot*/{
                  return CardSwiper (peliculas:snapshot.data); //cogemos la data que se encuentra en el snapshot
                  }else{
                    //sino me retorna un loading
                    return Container(//lo metemos en un contairer para dar diseño
                      height: 400.0, //lo desplazamos
                      child: Center //y lo centramos
                        (child: CircularProgressIndicator()));
                  } 
                },
             );
            }
          
           //tarjetas pequeñas
           Widget _footert(BuildContext context) {

             return Container(
               width: double.infinity,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Populares', style: Theme.of(context).textTheme.subhead)//Utilizamos temas global
                  ),
                   SizedBox(height: 5.0,),

                   StreamBuilder(
                     stream: peliculasProvider.popularesStream, //regresamos el Future que tenemos en el archivo peliculas_provider.dart
                     builder: (BuildContext context, AsyncSnapshot snapshot) {

                       if (snapshot.hasData){
                         return MovieHorizontal(peliculas:snapshot.data,
                         siguientePagina: peliculasProvider.getPopulares,
                         );
                       }
                       return Center(
                         child: CircularProgressIndicator()
                      );
                     }
                   )
                 ],
               ),
             );


            }
}