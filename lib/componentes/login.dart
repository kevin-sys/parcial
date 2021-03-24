import 'package:flutter/material.dart';
import 'package:flutterapp/menu.dart';

void main() => runApp(Login());

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController controladorusuario;
  TextEditingController controladorpass;

  @override
  void initState() {
    controladorusuario = TextEditingController();
    controladorpass = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar Sesión',
      routes: <String, WidgetBuilder>{
        "/MENU": (BuildContext context) => Menu(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('LogIn'),
        ),
        body: Column(
          children: [
            SizedBox(height: 5),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1608/tuktukdesign160800059/61010894-icono-de-usuario-hombre-perfil-hombre-de-negocios-avatar-ilustraci%C3%B3n-vectorial-persona-glifo.jpg?ver=6'),
            ),
            SizedBox(height: 5),
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  controller: controladorusuario,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Digite Usuario',
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controladorusuario.clear();
                        },
                      )
                      //probar suffix
                      ),
                  onSubmitted: (String nombres) {
                    cajatexto(context, nombres);
                  }),
            ),

            //contraseña
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  controller: controladorpass,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Digite Contraseña',
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controladorpass.clear();
                        },
                      )
                      //probar suffix
                      ),
                  onSubmitted: (String nombres) {
                    cajatexto(context, nombres);
                  }),
            ),
            SizedBox(height: 5),

            // Boton
            ElevatedButton(
              onPressed: () {
                if (controladorusuario.text.isNotEmpty &&
                    controladorpass.text.isNotEmpty) {
                  cajatexto(context, controladorusuario.text);
                  controladorusuario.clear();
                  controladorpass.clear();

                }

              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> cajatexto(BuildContext context, String user) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Bienvenido al Sistema'),
              content: Text('Señor(a) $user'),

          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
                child: Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.blue),
                )),

          ],
            ));
  }
}
