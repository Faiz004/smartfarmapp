import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/pages/scenarioDashboard.dart';
import 'package:smartfarmapp/widgets/drawer.dart';
import 'package:smartfarmapp/widgets/farmSlider.dart';

class farmDashboard extends StatefulWidget {
  final String usertoken;
  final SharedPreferences prefs;
  farmDashboard(this.prefs, this.usertoken);

  @override
  _farmDashboardState createState() => _farmDashboardState();
}

var username = "";
var email = "";

class _farmDashboardState extends State<farmDashboard> {
  Future fetchFarm() async {
    var payload = Jwt.parseJwt(widget.usertoken);
    var userid = payload['userid'];
    username = payload['username'];
    email = payload['email'];

    widget.prefs.setString('name', payload['username']);
    widget.prefs.setString('email', payload['email']);

    print('user id is: $userid');
    var url = 'http://192.168.0.103:5000/farm/byuser/$userid';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  var farmdata;
  @override
  void initState() {
    super.initState();
    farmdata = fetchFarm();
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
            "${widget.prefs.getString('name')}'s Farms",
            style: new TextStyle(fontSize: 25.0, fontFamily: "Rowdies"),
          ),
          new SizedBox(
            height: 10.0,
          ),
          FutureBuilder(
            future: farmdata,
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
                                    builder: (context) => scenarioDashboard(
                                        widget.prefs,
                                        snapshot.data[i]['id'],
                                        widget.usertoken)),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      new IconButton(
                                          icon: Icon(Icons.more_vert),
                                          onPressed: null)
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
                                        snapshot.data[i]['type'],
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
                                        snapshot.data[i]['city'],
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
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.data == null) {
                return Text(
                    "Oops! You dont have any farm setup yet. Please visit our website and setup your farms and comeback. Thank you.");
              }
              // By default, show a loading spinner.
              return LinearProgressIndicator(
                backgroundColor: Colors.green,
              );
            },
          ),
        ],
      ),
    );
  }
}
