import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


//esto va ha servir para mandar como argumentos los widget card que creemos
class CardSwiper extends StatelessWidget {
  
  //listas de tarjetas que vamos a mostrar
  final List<dynamic> peliculas;

  //inicializamos, requiriendo la lista peliculas
  CardSwiper({@required this.peliculas});
  
  @override
  Widget build(BuildContext context) {
    //sacamos información de las características de la pantalla del dispositivo
    final _screenSize = MediaQuery.of(context).size;

      return (Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Swiper(
            layout: SwiperLayout.STACK,
           
            //según las características damos un porcentaje
            itemWidth: _screenSize.width * 0.7,
            itemHeight: _screenSize.height * 0.5,
            itemBuilder: (BuildContext context,int index){
            return ClipRRect (
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,)
            ); //redondeamos los bordes
          },
           itemCount: 3,  
          //pagination: new SwiperPagination(), esto da la paginación
          //control: new SwiperControl(), y esto da los botones de navegación
        ),
      )
    );
  
  }
}