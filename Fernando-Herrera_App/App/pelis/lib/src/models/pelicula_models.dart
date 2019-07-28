
//esta clase va ha ser un contenedor de todas las películas que recibamos
class Peliculas{
  List<Pelicula> items = new List();//cramos una lista dinámica
  
  Peliculas();
 //recibimos el mapa de dotas las respuestas
  Peliculas.fromJsonList(List<dynamic> jsonList) {//para recibir el objeto de la API, es dinamica por que son de diferentes tipos de datos
    if (jsonList == null) return; //validamos si es null no reciba nada.
    for (var item in jsonList){//creamos la variable item para asignar los datos del jsonList
     
      final pelicula = new Pelicula.fromJsonMap(item);//creamos una última instancia llamada pelicula y construimios una clase 
      //asignando el parámetro de la variable item
      items.add(pelicula);//la almacenamos los datos del items lista que hemos creado.
    }
  }
}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;
 //este es el construcctor para recibir los datos del json
  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

//creamos nuestro constructor para intanciar al constructor Pelicula
Pelicula.fromJsonMap(Map<String, dynamic> json) {//creamos un mapa con un String y un dynamic, asignamos a cada una de las propiedades en relación con la API
voteCount         =json['vote_count'];
id                =json['id'];
video             =json['video'];
voteAverage       =json['vote_average'] / 1; //truco para convertir en double es dividir por 1.
title             =json['title'];
popularity        =json['popularity'] / 1;
posterPath        =json['poster_path'];
originalLanguage  =json['original_language'];
originalTitle     =json['original_title'];
genreIds          =json['genre_ids'].cast<int>(); //lo pasamos a tipo entero
backdropPath      =json['backdrop_path'];
adult             =json['adult'];
overview          =json['overview'];
releaseDate       =json['release_date'];
}

//creamos un método para retornar la imagen
getPosterImg() {
  //si posterPath es nule retorna una imagen de muestra
  if (posterPath == null){
    return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmGvECeGTH2HTICth4IJBGmqfW1MFBoRpA9YeToStExv7EbcQ-';
  }else{
     return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

 
}
}