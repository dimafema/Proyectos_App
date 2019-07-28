import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: MyTextField(),));
}

class MyTextField extends StatefulWidget {
  @override
  MyTextFieldState createState() => new MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  String inputValue = "";
  final TextEditingController controller = new TextEditingController();

  void onSubmitted(String value){
    setState(() {
     inputValue = inputValue + "\n" + value; 
     controller.text = "";
    });}
 
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editor de texto widget"),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Ingrese su texto"),
                onSubmitted: (String value) {onSubmitted(value);},
                controller: controller,
                ),
                new Text(inputValue),
            ],
          )
        ),
      ),
  );
  }
}