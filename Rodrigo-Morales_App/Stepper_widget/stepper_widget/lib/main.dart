import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyStepper(),
    ));
  
}

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => new _MyStepperState();
}

class _MyStepperState extends State<MyStepper>{
  
@override
Widget build(BuildContext contex){
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Stepper demo"),
    ),
  body: new Container(
    
  ),
  );
}

}