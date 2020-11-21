import 'package:flutter/material.dart';
import 'package:proyecto_final/house.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _password = "";
  String _usuario = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Container(
            height: 280.0,
            child: Image.asset(
              'assets/pantallados.PNG',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Nombre de usuario',
                labelStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.orange[700],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black)),
              ),
              onChanged: (value) {
                setState(() {
                  _usuario = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.orange[700],
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black))),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
              child: Container(
                child: RaisedButton(
                  onPressed: () {
                    if (_usuario == "claudia zorrilla" &&
                        _password == "claudiazorrilla") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => House(),
                          ));
                    } else
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Datos incorrectos'),
                          );
                        },
                      );
                    print("Cotraseña ó usuario incorrceto");
                  },
                  padding: const EdgeInsets.only(
                      left: 155.0, right: 155.0, top: 15.0, bottom: 15.0),
                  color: Colors.orange[600],
                  child: Text(
                    "Ingresar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 20.0),
            child: Text(
              "Aplicación desarrollada por: Claudia Patricia Zorrilla Rojas",
              style: TextStyle(color: Colors.black38),
            ),
          ),
        ]),
      ),
    );
  }
}

class Circulos extends StatelessWidget {
  final double radius;
  final List<Color> colors;

  const Circulos({Key key, this.radius, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          color: Colors.orange[600]),
    );
  }
}
