import 'package:flutter/material.dart';

//nos creamos una variable con dos parametros uno texto y otro tripo IconData
final _icons = <String, IconData> {
'add_alert'     : Icons.add_alert,  // asignamos datos
'accessibility' : Icons.accessibility,
'folder_open'   : Icons.folder_open,
'donut_large'   : Icons.donut_large,
'input'         : Icons.input,
'tune'          : Icons.tune,
'list'          : Icons.list,
};

//creamos una función que recoja los datos de la variable de arriba
Icon getIcon (String nombreIcono){ //le decimos que es de tipo texto y el nombre

return Icon(_icons[nombreIcono], color: Colors.blue); //retornamos un icono(texto azul) y en los parametros le damos de donde, tambien le damos color

}





