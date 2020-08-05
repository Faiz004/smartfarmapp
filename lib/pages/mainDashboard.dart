import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmapp/widgets/drawer.dart';

class mainDashboard extends StatefulWidget {
  @override
  _mainDashboardState createState() => _mainDashboardState();
}

class _mainDashboardState extends State<mainDashboard> {
  bool lightStatus = false;
  bool pumpStatus = false;
  bool motionStatus = false;
  bool windowStatus = false;

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
      body: new ListView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
        children: <Widget>[
          new SizedBox(
            height: 10.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Rice Crop",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Rowdies",
                ),
              ),
            ],
          ),
          new SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          new Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.invert_colors,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Soil Moisture",
                                      style: new TextStyle(fontSize: 16.0)),
                                  new Text("46.4",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                'Updated',
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.show_chart,
                                    color: Colors.red,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Humidity",
                                      style: new TextStyle(fontSize: 16.0)),
                                  new Text("22%",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                'Updated',
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.wb_sunny,
                                    color: Colors.red,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Temperature",
                                      style: new TextStyle(fontSize: 16.0)),
                                  new Text("29.5 C",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                'Updated',
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.grain,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Rain Condition",
                                      style: new TextStyle(fontSize: 16.0)),
                                  new Text("Not Raining",
                                      style: new TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                'Updated',
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              new Text(
                "Controls",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontFamily: "Rowdies",
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Light Bulb",
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  new SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  new CustomSwitch(
                                    activeColor: Colors.blue,
                                    value: lightStatus,
                                    onChanged: (value) {
                                      print("VALUE : $value");
                                      setState(() {
                                        lightStatus = value;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.local_drink,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Water Pump",
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  new SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  new CustomSwitch(
                                    activeColor: Colors.blue,
                                    value: pumpStatus,
                                    onChanged: (value) {
                                      print("VALUE : $value");
                                      setState(() {
                                        pumpStatus = value;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.fullscreen,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Window",
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  new SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  new CustomSwitch(
                                    activeColor: Colors.blue,
                                    value: windowStatus,
                                    onChanged: (value) {
                                      print("VALUE : $value");
                                      setState(() {
                                        windowStatus = value;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  child: new InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onPressed: null),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text("Motion Detect",
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  new SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  new CustomSwitch(
                                    activeColor: Colors.blue,
                                    value: motionStatus,
                                    onChanged: (value) {
                                      print("VALUE : $value");
                                      setState(() {
                                        motionStatus = value;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
