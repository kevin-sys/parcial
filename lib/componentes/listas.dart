import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=> _MyAppState();
}
class _MyAppState extends State<MyApp>{
List<Cliente>clientes=[
  Cliente(nombre:'Ever', apellido:'Gómez Navarro'),
  Cliente(nombre:'Shirley', apellido:'Cantillo Palmeras'),
  Cliente(nombre:'Kevin', apellido:'Gómez Cantillo'),
  Cliente(nombre:'Lucas', apellido:'Lopéz Botero'),
  Cliente(nombre:'Juan', apellido:'Oñate Oñate'),
  Cliente(nombre:'Ramon', apellido:'Duarte Caceres'),
  Cliente(nombre:'Anastacia', apellido:'Reyes Medina')
];
@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Material app',
    theme: ThemeData(primarySwatch: Colors.deepPurple,),
    home: Scaffold(
    appBar: AppBar(
      title: Text('Contactos KEVIN GOMEZ'),
    ),
      body:ListView.builder(itemCount: clientes.length,
      itemBuilder:(context, index){
        return ListTile(
          title: Text(clientes[index].nombre+ ' '+ clientes[index].apellido),
          leading: CircleAvatar(
            child: Text(clientes[index].apellido.substring(0,1)),
          ),
        );
      }
      )
  ),
  );
}

}
class Cliente {
  var nombre;
  var apellido;

  Cliente({this.nombre, this.apellido});
}