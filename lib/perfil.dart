import 'package:flutter/material.dart';
import 'package:proyecto_final/home_page.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Perfil"),
            backgroundColor: Colors.orange[600],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                child: CircleAvatar(
                    radius: (60.0),
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/avatar.jpg",
                          fit: BoxFit.cover, width: 110, height: 110),
                    )),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                    child: Column(
                      children: [
                        Text(
                          "Claudia Zorrilla",
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                          child: Text(
                            "Desarrolladora móvli",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black38),
                          ),
                        ),
                        Text(
                          "Medellín-Colombia",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black38),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 70.0, bottom: 60.0),
                          child: Container(
                              width: 150.0,
                              height: 150.0,
                              child: Image.asset('assets/logo.PNG')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140.0),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Salir",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.exit_to_app,
                                        size: 40.0,
                                        color: Colors.black38,
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HomePage(),
                                            ));
                                      }),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
