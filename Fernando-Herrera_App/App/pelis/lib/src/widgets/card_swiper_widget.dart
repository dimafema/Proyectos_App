import 'package:flutter/material.dart';


import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pelis/src/models/pelicula_models.dart';


//esto va ha servir para mandar como argumentos los widget card que creemos
class CardSwiper extends StatelessWidget {
  
  //listas de tarjetas que vamos a mostrar
  final List<Pelicula> peliculas;

  //inicializamos, requiriendo la lista peliculas
  CardSwiper({@required this.peliculas});
  
  @override
  Widget build(BuildContext context) {
    //sacamos información de las características de la pantalla del dispositivo
    final _screenSize = MediaQuery.of(context).size;

      return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Swiper(
            layout: SwiperLayout.STACK,
           
            //según las características damos un porcentaje
            itemWidth: _screenSize.width * 0.7,
            itemHeight: _screenSize.height * 0.5,
            itemBuilder: (BuildContext context,int index){
            return ClipRRect (
              borderRadius: BorderRadius.circular(20.0),
              //tomamos los datos del módelo que hemos creado en el archivo pelicula.models.dart
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg() ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              )
            );
          },
           itemCount: peliculas.length,  
          //pagination: new SwiperPagination(), esto da la paginación
          //control: new SwiperControl(), y esto da los botones de navegación
        ),
      );
  }
}