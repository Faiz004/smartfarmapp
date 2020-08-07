import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/pages/scenarioDashboard.dart';
import 'package:smartfarmapp/widgets/drawer.dart';

class ruleDashboard extends StatefulWidget {
  final String usertoken;
  final int scenarioid;
  final SharedPreferences prefs;
  ruleDashboard(this.prefs, this.scenarioid, this.usertoken);
  @override
  _ruleDashboardState createState() => _ruleDashboardState();
}

class _ruleDashboardState extends State<ruleDashboard> {
  Future fetchRule() async {
    var payload = Jwt.parseJwt(widget.usertoken);
    var userid = payload['userid'];
    print('user id is: $userid');
    var url = 'http://10.0.2.2:5000/rule/byscenario/${widget.scenarioid}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  var ruledata;
  @override
  void initState() {
    super.initState();
    ruledata = fetchRule();
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
            "Rules",
            style: new TextStyle(fontSize: 25.0, fontFamily: "Rowdies"),
          ),
          new SizedBox(
            height: 10.0,
          ),

          FutureBuilder(
            future: ruledata,
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => scenarioDashboard(
                              //           snapshot.data[i]['id'], widget.usertoken)),
                              // );
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
                                      // new IconButton(
                                      //     icon: Icon(Icons.more_vert),
                                      //     onPressed: null)
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
                                        'On Threshold: ${snapshot.data[i]['onthreshold']}',
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
                                        'Off Threshold: ${snapshot.data[i]['offthreshold']}',
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
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
          //farmSlider(),
        ],
      ),
    );
  }
}
