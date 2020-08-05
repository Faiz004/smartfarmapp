import 'package:flutter/material.dart';
import 'package:smartfarmapp/pages/scenarioDashboard.dart';

class farmSlider extends StatefulWidget {
  @override
  _farmSliderState createState() => _farmSliderState();
}

class _farmSliderState extends State<farmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7, //TotalFarms.length
          itemBuilder: (BuildContext context, int i) => Card(
              child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => scenarioDashboard()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Text(
                        'North Farm',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
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
                        'Type: Plantation',
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
                        'City: Gujrat',
                      ),
                      new SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
