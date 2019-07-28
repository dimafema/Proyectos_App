import 'package:flutter/material.dart';//importamo la libreria material.DragTarget

void main() {//creamos el método principal
  runApp(new MaterialApp(
    home: MyApp(),
      ));
    
    }
    
    class MyApp extends StatelessWidget{
      @override
      Widget build(BuildContext context){
        final double iconSize = 30.0;
        final TextStyle textStyle = new TextStyle(color: Colors.grey, fontSize: 25.0);
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("Este es el título de cabecera"),
          ),
          body: new Container(
            child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new MyCard(title: new Text("Este es la primera fila", style: textStyle),
                icon: new Icon(Icons.favorite, size: iconSize,color: Colors.redAccent)),       
                
                new MyCard(title: new Text("Este es la segunda fila", style: textStyle),
                icon: new Icon(Icons.thumb_up, size: iconSize, color: Colors.blueAccent)),    
                
                new MyCard(title: new Text("Este es la tercera fila", style: textStyle),
                icon: new Icon(Icons.queue_play_next, size: iconSize, color: Colors.brown)),    
              ],
            ),
            )
          ),
        );
      }
}
class MyCard extends StatelessWidget {
 final Widget title;
 final Widget icon;

 MyCard({this.title,this.icon});
 
 @override
 Widget build(BuildContext context) {
   return new Container(
     padding: const EdgeInsets.only(bottom: 3.0),
     child: new Card(
       child: new Container(
         padding: const EdgeInsets.all(
          20.0
         ),
       child: Column(
         children: <Widget>[this.title, this.icon],
       ),
     )
     )
   );
 }
}