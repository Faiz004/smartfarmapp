import 'package:flutter/material.dart';
import 'package:smartfarmapp/pages/mainDashboard.dart';

class scenarioSlider extends StatefulWidget {
  @override
  _scenarioSliderState createState() => _scenarioSliderState();
}

class _scenarioSliderState extends State<scenarioSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2, //TotalFarms.length
          itemBuilder: (BuildContext context, int i) => Card(
            child: new InkWell(
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainDashboard()),
              );
            },
              child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Text(
                        'Rice Crop',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      new IconButton(
                          icon: Icon(Icons.pause_circle_outline, color: Colors.red,),
                          onPressed: null),
                      new IconButton(
                          icon: Icon(Icons.more_vert), onPressed: null)
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Text(
                        'Crop: Rice',
                      ),
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Text(
                        'Start Date: 12/05/2020',
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
        ));
  }
}
