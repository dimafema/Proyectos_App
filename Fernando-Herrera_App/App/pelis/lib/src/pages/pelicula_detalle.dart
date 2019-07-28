import 'package:flutter/material.dart';
import 'package:pelis/src/models/pelicula_models.dart';



class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;//cramos una varable con agrumentos
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula), //llamo al método
        ],
      )//Este widget crea un elemntos cuando se crean sliver
      
    );
  }
  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      background: FadeInImage(
          image: NetworkImage(
            pelicula.getBackgrounImg()
            ),
          placeholder: AssetImage('assets/img/loading.gif') ,
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      )
    );
  }

}