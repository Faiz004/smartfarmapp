import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/pages/mainDashboard.dart';
import 'package:smartfarmapp/pages/ruleDashboard.dart';
import 'package:smartfarmapp/widgets/drawer.dart';
import 'package:http/http.dart' as http;

import 'package:smartfarmapp/widgets/scenarioSlider.dart';

class scenarioDashboard extends StatefulWidget {
  final int farmid;
  final String usertoken;
  final SharedPreferences prefs;
  scenarioDashboard(this.prefs, this.farmid, this.usertoken);

  @override
  _scenarioDashboardState createState() => _scenarioDashboardState();
}

class _scenarioDashboardState extends State<scenarioDashboard> {
  Future fetchScenario() async {
    var payload = Jwt.parseJwt(widget.usertoken);
    var userid = payload['userid'];
    print('user id is: $userid');
    var url = 'http://192.168.0.103:5000/scenario/byfarm/${widget.farmid}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  var scenariodata;
  @override
  void initState() {
    super.initState();
    scenariodata = fetchScenario();
  }

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
      drawer: drawerScreen(widget.prefs),
      body: new Column(
        children: <Widget>[
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            "Scenarios",
            style: new TextStyle(fontSize: 25.0, fontFamily: "Rowdies"),
          ),
          new SizedBox(
            height: 10.0,
          ),

          FutureBuilder(
            future: scenariodata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length, //TotalFarms.length
                      itemBuilder: (BuildContext context, int i) => Card(
                          elevation: 3.0,
                          child: new InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mainDashboard(
                                        widget.prefs,
                                        snapshot.data[i]['id'],
                                        snapshot.data[i]['name'],
                                        widget.farmid)),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text(
                                        snapshot.data[i]['name'],
                                        style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      new IconButton(
                                          icon: Icon(Icons.more_vert),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ruleDashboard(
                                                          widget.prefs,
                                                          snapshot.data[i]
                                                              ['id'],
                                                          widget.usertoken)),
                                            );
                                          })
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text(
                                        'Crop: ${snapshot.data[i]['crop']}',
                                      ),
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text(
                                        'Started: ${snapshot.data[i]['starttime']}',
                                      ),
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ));
              }
              // By default, show a loading spinner.
              return LinearProgressIndicator(
                backgroundColor: Colors.green,
              );
            },
          ),
          // scenarioSlider(),
        ],
      ),
    );
  }
}
