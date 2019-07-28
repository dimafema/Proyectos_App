import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyDialog(),
    ));
}

class MyDialog extends StatefulWidget {
  @override
  MyDialogState createState() => new MyDialogState();
}

enum DialogAction{
  yes,
  no
}
class MyDialogState extends State<MyDialog> {
  String _inputValue = "";
  void _alertResult(DialogAction action){
    print("Tu Selección es $action");
  }
  void _showAlert(String value){
   
    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      actions: <Widget>[
        new FlatButton(onPressed: (){_alertResult(DialogAction.yes);}, child: new Text("Si"),),
        new FlatButton(onPressed: (){_alertResult(DialogAction.no);}, child: new Text("no")),
      ],
    );
    
    showDialog( context: context, child: dialog,);
  }
    void _onChanged(String value){
      setState(() {
       _inputValue = value; 
      });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Alerta dialogo"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Ingrese su selección"
                ),
                onChanged: (String value){ _onChanged(value);},
              ),
              new RaisedButton(
                child: new Text("ver Alerta"),
                onPressed: (){_showAlert(_inputValue);},
              )
            ],
          ),
        ),
      ),
    );
  }
}