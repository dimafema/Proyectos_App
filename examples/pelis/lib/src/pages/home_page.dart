import 'package:flutter/material.dart';


import 'package:pelis/src/widgets/card_swiper_widget.dart';
import 'package:pelis/src/providers/peliculas_provider.dart';

//el snipper para crear el StatelessWidget es "stless"
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          _swiperTarjetas()
        ],
       ),
     ),
      
    );
  }


  //Swiper es un tipo de tarjeta de apariencia muy moderna
  Widget _swiperTarjetas(){

    final peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();
    return CardSwiper(
      peliculas: [1,2,3,4,5],
    );
  }
}