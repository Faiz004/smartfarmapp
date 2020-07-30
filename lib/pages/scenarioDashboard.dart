import 'package:flutter/material.dart';
import 'package:smartfarmapp/widgets/drawer.dart';

class scenarioDashboard extends StatefulWidget {
  scenarioDashboard({Key key}) : super(key: key);

  @override
  _scenarioDashboardState createState() => _scenarioDashboardState();
}

// ignore: camel_case_types
class _scenarioDashboardState extends State<scenarioDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

              appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Smart Farm',
              style: TextStyle(
                fontFamily: "Rowdies",
                fontSize: 27.0,
              //  fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
                  ),
            ),
            actions: <Widget>[
              
            ]),

      

      drawer: drawerScreen(),
       
    );
  }
}