import 'package:flutter/material.dart';

import 'package:pelis/src/models/pelicula_models.dart';



class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;  //Cremaos función

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});//la requerimos en esta función
  //cramos un controlador para ver cuando llega al final de las pelis en horizontal
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );
  
      @override
      Widget build(BuildContext context) {
        //controlamos la pantalla
        final _screenSize = MediaQuery.of(context).size;
        //se disparará cada vez que se mueva las imágenes horizontales cuando falte 200px
        _pageController.addListener((){
        if (_pageController.position.pixels >= _pageController.position.maxScrollExtent -200) {
          siguientePagina();
        }
        });
        

        return Container(
          height: _screenSize.height * 0.30,
          child: PageView.builder(//con el controlador builder, solo cargara bajo demanda, de esa manera no colapsamo la memoria 
            pageSnapping: false,
            controller: _pageController,
            //children: _tarjetas(context),
            itemCount: peliculas.length,//le decimos cuanto item tiene que renderizar
            itemBuilder: ( context, i) {
              return _tarjeta(context, peliculas[i]);//retornamos el método tarjeta
            },
          ), //este widget sirve para mostrar la tarjetas de modo horizontal con scroll
                      
        );
      }
            
           
           
           
            Widget _tarjeta(BuildContext context, Pelicula pelicula) {//requiere dos metodos contex y la pelicula
             final tarjeta = Container( //creamos una variable tipo container
                margin: EdgeInsets.only(right: 15.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                        image: NetworkImage(pelicula.getPosterImg()),
                        placeholder: AssetImage('assets/img/no-image.jpg'),
                        fit: BoxFit.cover,
                        height: 160.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      pelicula.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              );

              return GestureDetector(//Creamos otro widger, este sirve para saber cuando se pulsa el el widget tarjeta
                child: tarjeta,
                onTap: (){//detectamos el tap
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);//lo mandamos a otra pantalla "detalle"
                }
              );


           }

           
          //  List<Widget> _tarjetas(BuildContext context) {//creamos una lista de widget por que nos lo pide el children del widget PageView

          //   return peliculas.map((pelicula) {
          //     return Container(
          //       margin: EdgeInsets.only(right: 15.0),
          //       child: Column(
          //         children: <Widget>[
          //           ClipRRect(
          //             borderRadius: BorderRadius.circular(20.0),
          //               child: FadeInImage(
          //               image: NetworkImage(pelicula.getPosterImg()),
          //               placeholder: AssetImage('assets/img/no-image.jpg'),
          //               fit: BoxFit.cover,
          //               height: 160.0,
          //             ),
          //           ),
          //           SizedBox(height: 5.0,),
          //           Text(
          //             pelicula.title,
          //             overflow: TextOverflow.ellipsis,
          //             style: Theme.of(context).textTheme.caption,
          //           )
          //         ],
          //       ),
          //     );
          //   }).toList();

          //  }//esta no la estamos utilizando porque hemos optimizado la app


}
          