import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/pages/farmDashboard.dart';
import 'package:smartfarmapp/pages/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var usertoken = prefs.getString('usertoken');
  print('usertoken is: $usertoken');

  runApp(new MaterialApp(
    home: usertoken == null ? SplashScreen() : farmDashboard(prefs, usertoken),
    //home: Text(usertoken),
    debugShowCheckedModeBanner: false,
    title: "Smart Farm",
    theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.amber,
        backgroundColor: Colors.white),
    routes: <String, WidgetBuilder>{
      'pages/loginPage': (BuildContext context) => new loginPage(prefs)
    },
  ));
}

class SplashScreen extends StatefulWidget {
  final SharedPreferences prefs;
  SplashScreen({this.prefs});

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _navigationPage);
  }

  _navigationPage() {
    return Navigator.of(context).pushReplacementNamed('pages/loginPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
              child: Image.asset(
                'assets/images/SmartFarm.png',
                fit: BoxFit.fill,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
