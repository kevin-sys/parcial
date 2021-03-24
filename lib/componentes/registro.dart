import 'package:flutter/material.dart';

void main() => runApp(Registro());

class Registro extends StatefulWidget {

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  List<Cliente> _clientesadd = [];

  TextEditingController controladornombre;
  TextEditingController controladorapellido;
  TextEditingController controladortelefono;

  TextEditingController controladorprofesion;
  TextEditingController controladorfoto;

  @override
  void initState() {
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladortelefono = TextEditingController();
    controladorfoto = TextEditingController();
    controladorprofesion = TextEditingController();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Registro"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladornombre,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Nombres',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladornombre.clear();
                      },
                    )
                  //probar suffix
                ),
              ),
            ),

            //Apellidos
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladorapellido,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Apellidos',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladorapellido.clear();
                      },
                    )
                  //probar suffix
                ),
              ),
            ),
            //Telefono
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladortelefono,
                keyboardType: TextInputType.number, // Probar todos los teclados
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Edad',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladortelefono.clear();
                      },
                    )
                  //probar suffix
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladorprofesion,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Profesión',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladorprofesion.clear();
                      },
                    )
                  //probar suffix
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: controladorfoto,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Foto',
                    // suffix: Icon(Icons.access_alarm),
                    suffix: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controladorfoto.clear();
                      },
                    )
                  //probar suffix
                ),
              ),
            ),
            // Boton
            ElevatedButton(
              //Paso # 3
              //En el Boton Enviar Datos

              onPressed: () {
                if (controladornombre.text.isNotEmpty &&
                    controladorapellido.text.isNotEmpty&&controladorfoto.text.isNotEmpty&&controladorprofesion.text.isNotEmpty) {
                  // Agregar a la lista los valores de cada texto

                  _clientesadd.add(Cliente(
                      nombre: controladornombre.text,
                      apellido: controladorapellido.text,
                      telefono: controladortelefono.text,
                    foto: controladorfoto.text,
                    profesion: controladorprofesion.text
                  ));

                  Navigator.pop(context, _clientesadd);
                }
              },
              child: Text('Guardar Datos'),
            ),

            //
          ],
        ),
      ),
    );
  }
}
class Cliente {
  var nombre;
  var apellido;
  var telefono;
  var profesion;
  var foto;



  Cliente({this.nombre, this.apellido, this.telefono, this.foto, this.profesion});
}