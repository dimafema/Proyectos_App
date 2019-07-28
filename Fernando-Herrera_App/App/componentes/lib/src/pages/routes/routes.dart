
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_page.dart';

//hemos creado un método para rastear todas nuestras rutas en este archivo routas para estar mas organizado.

Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder>{//con la propiedad routes damos las direcciones de las pantallas 
          '/'                     : (BuildContext context) => HomePage(), //le decimos que en raiz tenemos la página principal
          'alert'                 : (BuildContext context) => AlertPage(),
          'avatar'                : (BuildContext context) => AvatarPage(),
          'card'                  : (BuildContext context) => CardPage(),
          'animatedContainer'     : (BuildContext context) => AnimatedContainerPage(),
          'inputs'                : (BuildContext context) => InputPage(),
          'slider'                : (BuildContext context) => SliderPage(),
          'list'                  : (BuildContext context) => ListaPage(),
  };
}