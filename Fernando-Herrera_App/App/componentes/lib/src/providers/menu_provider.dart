import 'package:flutter/services.dart' show rootBundle;//esta es otro librería que sirve para utilizar servicios como archivos json
import 'dart:convert';

class _MenuProvider {//la clase la creamos privada 
List<dynamic> opciones = [];


    _MenuProvider(){
     //cargarData();
    }
    
    //con este método leemos el archivos json una vez se haya cargado la lista actualizada
      Future<List<dynamic>> cargarData() async {//comando future para trabajar en asincronia dentro una lista y es tipo dinamica
    
    final resp = await rootBundle.loadString('data/menu_opts.json'); //variable de donde coge los datos JSON
    
      Map dataMap = json.decode(resp);//convertimos el string a mapa
      print(dataMap['rutas']);
      opciones = dataMap['rutas']; //a la lista privada de clase "opciones" le decimos que datos coger de la lista que esta en el archivo JSON

      return opciones; //retornamos los datos y se los pasamsos a la constante final "menuProvider"
    }
}
//aquí instanciamos los dato de la clase creada arriba
final menuProvider = new _MenuProvider();


