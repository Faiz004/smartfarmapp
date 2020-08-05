import 'package:flutter/material.dart';
import 'package:smartfarmapp/widgets/drawer.dart';
import 'package:smartfarmapp/widgets/farmSlider.dart';

class farmDashboard extends StatefulWidget {
  @override
  _farmDashboardState createState() => _farmDashboardState();
}

class _farmDashboardState extends State<farmDashboard> {
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
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          actions: <Widget>[]),
      drawer: drawerScreen(),
      body: new Column(
        children: <Widget>[
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            "Jhonny's Farms",
            style: new TextStyle(fontSize: 25.0,  fontFamily: "Rowdies"),
          ),
           new SizedBox(
            height: 10.0,
          ),
          farmSlider(),
        ],
      ),
    );
  }
}
