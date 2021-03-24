import 'package:flutterapp/componentes/registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MisContactos());
}

class MisContactos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Listas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Cliente> _clientes = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _clientes.length,
          itemBuilder: (context, index) {
            return ListTile(


              onLongPress: () {
                setState(() {
                  _eliminarcliente( context, _clientes[index]);
                });
              },
              title: Text(
                  _clientes[index].nombre + ' ' + _clientes[index].apellido +', La profesión es: '+_clientes[index].profesion),
              subtitle: Text('La edad es: '+_clientes[index].telefono),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1608/tuktukdesign160800059/61010894-icono-de-usuario-hombre-perfil-hombre-de-negocios-avatar-ilustraci%C3%B3n-vectorial-persona-glifo.jpg?ver=6'),
              ),
              trailing: Icon(Icons.arrow_circle_up),
            );
          }),

      //Paso # 1
      //Este es el Boton Adicionar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  Registro(), //Llamar la Vista TextoEjercicio
            ),
          ).then((resultado) //Espera por un Resultado
          { _clientes.addAll(resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
          setState(() {});
          });
        },
        tooltip: 'Adicionar Cliente',
        child: Icon(Icons.add),
      ),

      //
    );
  }

  _eliminarcliente(context, Cliente clienteid){
    showDialog(context: context,
        builder: (_)=> AlertDialog(
          title: Text('Eliminar Cliente'),
          content: Text('Esta seguro de eliminar a: ' + clienteid.nombre),
          actions: [
            TextButton(onPressed: () {
              setState(() {
                this._clientes.remove(clienteid);
                Navigator.pop(context);
              });
            },
                child: Text(
                  'Eliminar',
                  style:  TextStyle(color: Colors.red),
                )
            ),



          ],
        ));

  }
}


