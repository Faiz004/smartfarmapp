import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartfarmapp/pages/loginPage.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    title: 'Smart Agri Farm',
    theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.amber,
          backgroundColor: Colors.white
        ),
    routes: <String, WidgetBuilder> {'pages/loginPage': (BuildContext context) => new loginPage()},
  ));
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

    void navigationPage() {
    Navigator.of(context).pushReplacementNamed('pages/loginPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
         child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/SmartFarm.png', 
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150,),
                ),

              ],
         ),
      ),
    );
  }
}
