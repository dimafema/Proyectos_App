
import 'package:flutter/material.dart';


//nuestras librerias
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista() ,//hemos creado una lista le damos "cmd" y "." elegir crear método lista, despues a "cmd" "z" y nos lo arregla
    );
  }

 Widget _lista() {
   //llamamos a menu_provider.dart y lo imprimimos por consola.
  //creamos el retorno de un widget llamado FutureBuilder,para repintar los datos del Future
  return FutureBuilder(
    future: menuProvider.cargarData(),//la primera propiedad es la propiedad future (texto blanco), se utiliza para cargar los datos del future creado.
    initialData: [], //esta propiedad es la que dice que información por defecto va a tener mientras no se resuelva la carga de datos
    builder: /*es una función que recibe dos argumentos*/ (BuildContext context, /*es el argumento que no pide*/ AsyncSnapshot<List<dynamic>>snapshot /*este es el otro que nos exige*/) { /*es una propiedad que requiere 
    el método FutureBuilder (texto azul), obligatoriamente, para orientarme un builder es algo que se imprime en pantalla*/
    return ListView(children: _listaItem(snapshot.data, context),); //retornamos la lista de Items y tambien del context, esto último nos va ha servir para navegar por pantallas
    });
}

List<Widget> _listaItem(List<dynamic> data, BuildContext context ) {//aquí es donde metemos la lista y tambien cogemos los datos del context
    
  final List<Widget> opciones = []; // creo una variable de tipo lista widget (texto azul) le llamo opciones y la dejo vacía.
    

  data.forEach ( (opt) { //recorro toda la lista
    final widgetTemp = ListTile(
      title: Text(opt['texto']), //cogemos los items de tipo texto del archivo JSON.
      leading: getIcon(opt['icon']), //le ponemos iconos a la derecha, que lo cogemos del la función que hemos creado en la carpeta utils el archivo icono_string_util.dart
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),// le ponemos icono a la izquierda
      //acción que hace cuando pulsa
      onTap: (){
        //creamos una variable con la ruta de la página
        //hacemos un puschnamed 
        Navigator.pushNamed(context, opt['ruta']);//dos argumentos, el context lo cogemos de widget _lista, si te fijal retornamos dos parametros uno data y otro un BuildContext
        //y otro el nombre de la dirección de la página



      },
    );

    opciones..add(widgetTemp)//agregamos los datos lista para imprimir
              ..add(Divider());//le metemos una barra divisoria
  });

    return opciones; // por último retornamos los datos
}
}