import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/widgets/drawer.dart';

class mainDashboard extends StatefulWidget {
  final SharedPreferences prefs;
  final int scenarioid;
  final String scenarioname;
  final int farmid;

  mainDashboard(this.prefs, this.scenarioid, this.scenarioname, this.farmid);
  @override
  _mainDashboardState createState() => _mainDashboardState();
}

class _mainDashboardState extends State<mainDashboard> {
  changeswitch(var sfid, var cmd) async {
    // setState(() {
    //   isloading = true;
    // });
    print('sfid is : $sfid');
    print('Command is: $cmd');

    String url = 'http://192.168.0.103:5000/fetchsensordata/data';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"sfid": "$sfid","cmd": "$cmd"}';

    http.Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
    print(response.body);
    if (statusCode == 200) {
      try {
        var msg = response.body.toString();
        var x = jsonDecode(response.body);
        //  _usertoken = x.toString();
        x.forEach((key, value) {
          print("Key : $key value $value");
          msg = value;
        });
        print('x is $x');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  content: Text(msg.toString()),
                  actions: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Retry",
                              style: TextStyle(
                                fontFamily: "Rowdies",
                                color: Colors.white,
                                fontSize: 17,
                              )),
                        )),
                  ],
                ),
              );
            });
      } catch (e) {
        print('no');
      }
    } else {
      print('something went wrong');
    }
  }

  Future fetchSensorfields() async {
    // var payload = Jwt.parseJwt(widget.usertoken);
    // var userid = payload['userid'];
    // print('user id is: $userid');
    var url = 'http://192.168.0.103:5000/sensorfield/byfarm/${widget.farmid}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List processeddata = [];
      print(response.body);
      var mydata = json.decode(response.body);
      for (int i = 0; i < mydata.length; i++) {
        for (int j = 0; j < mydata[i].length; j++) {
          processeddata.add(mydata[i][j]);
        }
      }
      return processeddata;
    } else {
      throw Exception('Failed to load post');
    }
  }

  var sensorfielddata;

  @override
  void initState() {
    super.initState();
    sensorfielddata = fetchSensorfields();
  }

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
      drawer: drawerScreen(widget.prefs),
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
                "${widget.scenarioname}",
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
              new SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              new Text(
                "Sensors",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontFamily: "Rowdies",
                ),
              ),
            ],
          ),
          new SizedBox(
            height: 10.0,
          ),

          FutureBuilder(
            future: sensorfielddata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length, //TotalFarms.length

                        itemBuilder: (BuildContext context, int i) => (!snapshot
                                .data[i]['isactuator'])
                            ? Card(
                                elevation: 3.0,
                                child: new InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text(
                                              '${snapshot.data[i]['name']}',
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text(
                                              '${snapshot.data[i]['IOTData'][0]['value'].toString()}',
                                              style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: "Rowdies"),
                                            ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text(
                                              '${snapshot.data[i]['type'].toString()}',
                                            ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            : new Container()));
              }
              // By default, show a loading spinner.
              return LinearProgressIndicator(
                backgroundColor: Colors.green,
              );
            },
          ),

          new SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
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

          FutureBuilder(
            future: sensorfielddata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length, //TotalFarms.length

                        itemBuilder: (BuildContext context, int i) => (snapshot
                                .data[i]['isactuator'])
                            ? Card(
                                elevation: 3.0,
                                child: new InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text(
                                              '${snapshot.data[i]['name']}',
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            // Text(
                                            //   '${snapshot.data[i]['IOTData'][0]['value'].toString()}',
                                            // ),

                                            (snapshot.data[i]['IOTData'][0]
                                                        ['value'] ==
                                                    "1")
                                                ? new SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.19,
                                                    child: new CustomSwitch(
                                                      value: true,
                                                      activeColor: Colors.green,
                                                      onChanged: (value) {
                                                        print("VALUE : $value");
                                                        var cmd;
                                                        if (value == true) {
                                                          cmd = "1";
                                                        } else {
                                                          cmd = "0";
                                                        }
                                                        print("sfid is: ");
                                                        print(snapshot.data[i]
                                                            ['id']);
                                                        print("cmd  is: $cmd");
                                                        changeswitch(
                                                            snapshot.data[i]
                                                                ['id'],
                                                            cmd);
                                                      },
                                                    ),
                                                  )
                                                : new SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.19,
                                                    child: new CustomSwitch(
                                                      value: false,
                                                      activeColor: Colors.green,
                                                      onChanged: (value) {
                                                        print("VALUE : $value");
                                                        var cmd;
                                                        if (value == true) {
                                                          cmd = "1";
                                                        } else {
                                                          cmd = "0";
                                                        }
                                                        print("sfid is: ");
                                                        print(snapshot.data[i]
                                                            ['id']);
                                                        print("cmd  is: $cmd");
                                                        changeswitch(
                                                            snapshot.data[i]
                                                                ['id'],
                                                            cmd);
                                                      },
                                                    ),
                                                  ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text(
                                              '${snapshot.data[i]['type'].toString()}',
                                            ),
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            : new Container()));
              }
              // By default, show a loading spinner.
              return LinearProgressIndicator(
                backgroundColor: Colors.green,
              );
            },
          ),

          // new Row(
          //   children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         icon: Icon(
          //                           Icons.invert_colors,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Soil Moisture",
          //                             style: new TextStyle(fontSize: 16.0)),
          //                         new Text("46.4",
          //                             style: new TextStyle(
          //                                 fontSize: 20.0,
          //                                 fontWeight: FontWeight.bold))
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.15,
          //                     ),
          //                     Text(
          //                       'Updated',
          //                     ),
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     new SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.02,
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         icon: Icon(
          //                           Icons.show_chart,
          //                           color: Colors.red,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Humidity",
          //                             style: new TextStyle(fontSize: 16.0)),
          //                         new Text("22%",
          //                             style: new TextStyle(
          //                                 fontSize: 20.0,
          //                                 fontWeight: FontWeight.bold))
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.15,
          //                     ),
          //                     Text(
          //                       'Updated',
          //                     ),
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          // new Row(
          //   children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         icon: Icon(
          //                           Icons.wb_sunny,
          //                           color: Colors.red,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Temperature",
          //                             style: new TextStyle(fontSize: 16.0)),
          //                         new Text("29.5 C",
          //                             style: new TextStyle(
          //                                 fontSize: 20.0,
          //                                 fontWeight: FontWeight.bold))
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.15,
          //                     ),
          //                     Text(
          //                       'Updated',
          //                     ),
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     new SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.02,
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         icon: Icon(
          //                           Icons.grain,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Rain Condition",
          //                             style: new TextStyle(fontSize: 16.0)),
          //                         new Text("Not Raining",
          //                             style: new TextStyle(
          //                                 fontSize: 15.0,
          //                                 fontWeight: FontWeight.bold))
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.15,
          //                     ),
          //                     Text(
          //                       'Updated',
          //                     ),
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          // new Row(
          //   children: <Widget>[
          //     new SizedBox(
          //       height: MediaQuery.of(context).size.height * 0.04,
          //     ),
          //     new Text(
          //       "Controls",
          //       textAlign: TextAlign.center,
          //       style: new TextStyle(
          //         fontSize: 20.0,
          //         color: Colors.grey,
          //         fontFamily: "Rowdies",
          //       ),
          //     ),
          //   ],
          // ),
          // new Row(
          //   children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         iconSize: 5.0,
          //                         icon: Icon(
          //                           Icons.lightbulb_outline,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Light Bulb",
          //                             style: new TextStyle(
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold)),
          //                         new SizedBox(
          //                           height: MediaQuery.of(context).size.height *
          //                               0.02,
          //                         ),
          //                         new CustomSwitch(
          //                           activeColor: Colors.blue,
          //                           value: lightStatus,
          //                           onChanged: (value) {
          //                             print("VALUE : $value");
          //                             setState(() {
          //                               lightStatus = value;
          //                             });
          //                           },
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     new SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.02,
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         iconSize: 5.0,
          //                         icon: Icon(
          //                           Icons.local_drink,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Water Pump",
          //                             style: new TextStyle(
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold)),
          //                         new SizedBox(
          //                           height: MediaQuery.of(context).size.height *
          //                               0.02,
          //                         ),
          //                         new CustomSwitch(
          //                           activeColor: Colors.blue,
          //                           value: pumpStatus,
          //                           onChanged: (value) {
          //                             print("VALUE : $value");
          //                             setState(() {
          //                               pumpStatus = value;
          //                             });
          //                           },
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // new Row(
          //   children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         iconSize: 5.0,
          //                         icon: Icon(
          //                           Icons.fullscreen,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Window",
          //                             style: new TextStyle(
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold)),
          //                         new SizedBox(
          //                           height: MediaQuery.of(context).size.height *
          //                               0.02,
          //                         ),
          //                         new CustomSwitch(
          //                           activeColor: Colors.blue,
          //                           value: windowStatus,
          //                           onChanged: (value) {
          //                             print("VALUE : $value");
          //                             setState(() {
          //                               windowStatus = value;
          //                             });
          //                           },
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     new SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.02,
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.18,
          //       child: Card(
          //         child: new InkWell(
          //           child: Container(
          //             width: MediaQuery.of(context).size.width * 0.43,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 new Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: <Widget>[
          //                     new IconButton(
          //                         iconSize: 2.0,
          //                         icon: Icon(
          //                           Icons.lock_outline,
          //                           color: Colors.blue,
          //                           size: 40.0,
          //                         ),
          //                         onPressed: null),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.01,
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.01,
          //                     ),
          //                     new Column(
          //                       children: <Widget>[
          //                         new Text("Motion Detect",
          //                             style: new TextStyle(
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold)),
          //                         new SizedBox(
          //                           height: MediaQuery.of(context).size.height *
          //                               0.02,
          //                         ),
          //                         new CustomSwitch(
          //                           activeColor: Colors.blue,
          //                           value: motionStatus,
          //                           onChanged: (value) {
          //                             print("VALUE : $value");
          //                             setState(() {
          //                               motionStatus = value;
          //                             });
          //                           },
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 new Row(
          //                   children: <Widget>[
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                     new SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.04,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
