import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

String _nombre = ''; // creamos una variable en vacío
String _email  = '';
String _fecha  = '';
TextEditingController _inputFieldDateController = TextEditingController();//esta variable nos permite manejar relación con la caja de texto
List <String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];//damos valores a la lista
String _opcionSeleccionada = 'Volar';

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),//cramos un metodo para construir el input
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
                                        
                            ],
                          ),
                        );
                      }
                                                  
            Widget  _crearInput() {
                                            return TextField (//hay dos tipos de TextField, este trabaja mejor de manera independiente.
                                              autofocus: true, //cuando entre la página se de automaticamente el foco (selección)
                                              textCapitalization: TextCapitalization.sentences, //quiero obligarlo a que la primera letra sea mayúscula
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(//le damos borde al input
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                counter: Text('Letras ${_nombre.length}'), //esto es un texto que aparece en la parte derecha del input
                                                hintText: 'Nombre de la persona', //Sugerencia que le damos antes de introducir un texto en el input
                                                labelText: 'Nombre',//Nombre del input
                                                helperText: 'Solo es el nombre' ,//texto de ayuda del input sale abajo
                                                suffixIcon: Icon(Icons.accessibility), //icono parte derecha 
                                                icon: Icon(Icons.account_circle), //ponemos un icono en la izquierda
                                              ),
                                              onChanged: (valor){//en el argumento tomamos el valor del input
                                               setState(() {
                                                  _nombre = valor; //le pasamos el valor a la variable nombre
                                               });
                                              },
                                            );
                                        
                                          }
                                        
            Widget _crearPersona() {
                                            return ListTile(
                                              title: Text('Nombre es: $_nombre'),
                                              subtitle: Text('Email: $_email'),
                                              trailing: Text(_opcionSeleccionada),
                                            );
                                          }
                              
            Widget _crearEmail() {
                                            return TextField (//hay dos tipos de TextField, este trabaja mejor de manera independiente.
                                             keyboardType: TextInputType.emailAddress,//este widget nos sirve para introducir formato email, lo tenemos en la propiedad KeuboardType (texto blanco)
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(//le damos borde al input
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                hintText: 'Email', //Sugerencia que le damos antes de introducir un texto en el input
                                                labelText: 'Email',//Nombre del input
                                                suffixIcon: Icon(Icons.alternate_email), //icono parte derecha 
                                                icon: Icon(Icons.email), //ponemos un icono en la izquierda
                                              ),
                                              onChanged: (valor)/*en el argumento tomamos el valor del input*/ =>setState(() {
                                                 _email = valor;//le pasamos el valor a la variable nombre
                                               })
                                            );
                                        
                                          }
                    
            Widget _crearPassword() {
                                          return TextField (//hay dos tipos de TextField, este trabaja mejor de manera independiente.
                                              obscureText:true , //le damos esta propiedad para ocultar texto, ya que es el pass
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(//le damos borde al input
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                hintText: 'pass', //Sugerencia que le damos antes de introducir un texto en el input
                                                labelText: 'pass',//Nombre del input
                                                suffixIcon: Icon(Icons.lock_open), //icono parte derecha 
                                                icon: Icon(Icons.lock), //ponemos un icono en la izquierda
                                              ),
                                              onChanged: (valor)/*en el argumento tomamos el valor del input*/ =>setState(() {
                                                 _email = valor;//le pasamos el valor a la variable nombre
                                               })
                                            );
                                        }
          
            Widget _crearFecha(BuildContext context) {
              return TextField (//hay dos tipos de TextField, este trabaja mejor de manera independiente.
                enableInteractiveSelection: false, //para que no interactuen con el input
                controller: _inputFieldDateController, //cogemos los datos de la variable
                decoration: InputDecoration(
                  border: OutlineInputBorder(//le damos borde al input
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Fecha de nacimiento', //Sugerencia que le damos antes de introducir un texto en el input
                  labelText: 'Fecha de nacimiento',//Nombre del input
                  suffixIcon: Icon(Icons.perm_contact_calendar), //icono parte derecha 
                  icon: Icon(Icons.calendar_today), //ponemos un icono en la izquierda
                  ),
                onTap: (){//método que permite lanzar el selector de fecha
                  FocusScope.of(context).requestFocus(new FocusNode());//quitamos el foco del input
                  _selecDate(context);
                }, 
              );
            }
                  //cargamos un calendario predeterminado
                  _selecDate(BuildContext context) async {
                    DateTime picked = await showDatePicker(//con esto sacamos una pantalla flotante para elegir la fecha
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(2018),//fecha inicial que muestra
                      lastDate: new DateTime(2025),//fecha máxima que aparece en el calendario
                      locale: Locale('es', 'ES') //detecta el idioma del sistema
                    );
                    if (picked != null ) {//si el valor es diferente de nulo, es decir que seleccionamos fecha, colocar fecha en la caja de texto
                      setState(() {
                        _fecha = picked.toString();// con esto le damos el valor a la varieble _fecha
                        _inputFieldDateController.text = _fecha; //asignamos el valor fecha a la variable inputFiledDateController
                      });
                    }
                  }

            //es una opción que despliega varios items interno para seleccionar
            
            List<DropdownMenuItem<String>> getOpcionesDropdown(){
            
              List<DropdownMenuItem<String>> lista = new List();//creamos una lista
              _poderes.forEach((poder){
                  lista.add(DropdownMenuItem(
                    child: Text(poder),
                    value: poder,
                  ));
              });

              return lista;

            }
            Widget _crearDropdown() {
              
            return Row(
                children: <Widget>[
                Icon(Icons.select_all),
                SizedBox(width: 30.0,),
                Expanded(
                  child: DropdownButton(
                  value: _opcionSeleccionada, //le damos el valor por defecto
                  items: getOpcionesDropdown(),//llamamos a la lista que hemos creado
                    onChanged: (opt){//se redibuja la opción seleccionada
                    setState(() {
                      _opcionSeleccionada = opt;
                    });
                  },
                  ),
                )
              ],
            );

              

          }
}



