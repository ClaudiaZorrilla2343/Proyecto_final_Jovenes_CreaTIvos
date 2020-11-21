import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplasPagehState createState() => _SplasPagehState();
}

class _SplasPagehState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 415,
            height: 790,
            color: Colors.deepOrange,
            child: Image.asset(
              'assets/splahs.png.PNG',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
