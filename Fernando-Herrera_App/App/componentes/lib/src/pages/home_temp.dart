import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //hemos creado una lista con cinco parametros
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes text'),
      ),
      body: ListView(//este widget sirve para hacer scrolll en pantalla
        children: _crearItemsCorta()
      ),
      
    );
  }

  //cramos un método para tomar los valores de "opciones" crear los items
  
//OPCIÓN CORTA PARA CREAR LISTAS
List<Widget> _crearItemsCorta(){
  return opciones.map((item){
    return Column(
      children: <Widget>[
        ListTile(
          subtitle: Text('subtitulo'), //esta propiedad con crea un subtitulo debajo del items
          leading: Icon(Icons.access_alarms), //nos da un widget en la parte derecha del items, en el caso he colocado un icono
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){}, // es un método que ejecuta una función al pulsar
          title: Text (item),
          ),
          Divider()
      ],
    );
  }).toList();//lo convertimos a lista

}



//OTRA OPCIÓN DE CREAR LISTAS
/*List<Widget> _crateItem(){

    //Creamos un Widget de lista
    List<Widget> lista = new List<Widget>();
    //con el comando for vamos a recorrer toda la lista de opciones
    for (String opt in opciones) {//le decimos que son datos string
     
     
     //y con final decimos lo que queremos mostrar en cada lista
      final tempWidget = ListTile(
        title: Text(opt),//llamamos a "opt" para que recojas los datos
      );
    //cuando el ciclo for termine me manda el item al widget de lista con nombre lista que se ha creado al principio
    lista..add(tempWidget )
        ..add(Divider());//a la vez vamos creando divisores automáticos con un operador en cascada ".."

    }
    //y ahora retornamos la lista de items
    return lista;
    
  }*/
}