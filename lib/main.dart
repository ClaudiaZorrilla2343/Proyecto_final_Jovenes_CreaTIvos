import 'package:flutter/material.dart';
import 'package:proyecto_final/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SplashPage(),
    );
  }
}
