import 'package:flutter/material.dart';
import 'package:flutterapp/componentes/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'pantalla Principal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          "/LOGIN": (BuildContext context) => Login(),
        },
        home: Login());
  }
}
