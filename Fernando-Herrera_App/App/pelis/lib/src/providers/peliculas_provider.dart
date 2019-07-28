


import 'dart:async';

import 'package:pelis/src/models/pelicula_models.dart';
import 'package:http/http.dart' as http; //con el as le damos nombre a la librería importada
import 'dart:convert';

//cramos la clase
class PeliculasProvider {
    //creamos las porpiedades privada de esta clase
  String _apikey    = '793b5ccab5f493cd419a54dd70743999'; //API key que nos han proporcionado
  String _url       = 'api.themoviedb.org'; //la raiz de la petición de la web
  String _languaje  = 'es-ES'; //el lenguaje que vamos a utilizar
  int _popularesPage = 0; //la página que queremos mostrar
  bool _cargando = false; //creo una propiedad booleana en falsa

  //MANEJO DE STREAM
  List<Pelicula> _populares = new List(); //cramos la propiedad stream cramos la lista de peliculas 

  final _popularesStreamControler = StreamController<List<Pelicula>>.broadcast();// Código para crear el stream, tenemos que importar "dart:async", y le decimos que es una lista, 
  //broadcast (texto verde) nos sirve para que muchos lugares puedan escuchar a la vez

  Function(List<Pelicula>) get popularesSink => _popularesStreamControler.sink.add;//método para insertar información al stream

  Stream<List<Pelicula>> get popularesStream => _popularesStreamControler.stream; //método para escuchar todo lo que stream emita

  
  
  void disposeStreams(){//metodo para cerrar el steam
    _popularesStreamControler?.close();//si tiene algún valor me lo cierras
  }

    //este Future, lo creamos para no duplicar código, creamos el método y lo reutilizamos mas eficientemente
    Future<List<Pelicula>>_procesarRespuesta(Uri url) async { //es un listado de películas
        //creamos otra variable con la respuesta de la dirección
      final resp = await http.get( url ); //hemos registrado en el archivos pubspec.yaml para importar http.dart
      //decodificamos la información que recibimos de resp
      final decodedData = json.decode(resp.body);//debemos de importar la librería "confert" de Dart
      //los tranformamos los datos como queremos
      final peliculas = new Peliculas.fromJsonList(decodedData['results']); //con el contructor generamos las peliculas según nuestro modelo para almacenar en el archivos "peliculas_provider.dart"
      //exactamente en la variable items
      return peliculas.items; //al final retornamos la variable, ya que esto es una lista de películas para ser usada
    }

    //Creamos el método para que recoja todo los datos, es futuro y con retardo para que adquiera los datos
    Future<List<Pelicula>> getEnCines() async {  //es un listado de películas
      //contruimos primero el url con la librería Uri que es un objeto propio de Dart
      final url = Uri.https(_url, '3/movie/now_playing', { //creamos la varieble url, nos pide la propiedad _url, y despues el pacht lo sacamos de la web
        'api_key'  : _apikey,//metenos a parte los parametros que nos interese
        'language' : _languaje,//y el lenguaje
      });
      return await _procesarRespuesta(url);//retornamos el método _procesarRespuesta
      
    }
    
    //cramos el otro Futura pero esta vez con las péliculas populares
    Future<List<Pelicula>> getPopulares() async {   //es un listado de películas
      if (_cargando) return [];//si estoy cargando datos no hago nada
      
      _cargando = true;//y si no estoy cargando entonces cargo dato
      
      _popularesPage++; //le sumamos uno cada verz que corra el método

      final url = Uri.https(_url, '3/movie/popular', { //solamente hemos cambiado el enlace
        'api_key'  : _apikey,
        'language' : _languaje,
        'page'     : _popularesPage.toString()//convertimo en string el dato
      });
     //cramos una variable con los datos de método reseñado
     final resp = await _procesarRespuesta(url);//retornamos procesar respuesta

     _populares.addAll(resp);//a la variable añadimos los datos de la variables 
     popularesSink(_populares);//añadimo al stream los datos del método, 
    _cargando = false;//una vez echo otra vez vuelve a su estado.
     return resp;//retornamos la respuesta
    
    }

}