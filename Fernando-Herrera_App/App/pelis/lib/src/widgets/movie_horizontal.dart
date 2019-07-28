import 'package:flutter/material.dart';

import 'package:pelis/src/models/pelicula_models.dart';



class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});
  
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );
  
      @override
      Widget build(BuildContext context) {
        final _screenSize = MediaQuery.of(context).size;

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
            itemCount: peliculas.length,
            itemBuilder: ( context, i) {
              return _tarjeta(context, peliculas[i]);
            },
          ), //este widget sirve para mostrar la tarjetas de modo horizontal con scroll
                      
        );
      }
            
           
           
           
            Widget _tarjeta(BuildContext context, Pelicula pelicula) {
             final tarjeta = Container(
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

              return GestureDetector(
                child: tarjeta,
                onTap: (){
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
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
          