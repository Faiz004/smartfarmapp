import 'package:flutter/material.dart';

// ignore: camel_case_types
class signupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signupPage();
}

// ignore: camel_case_types
class _signupPage extends State<signupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          // height: MediaQuery.of(context).size.height,
          // color: Colors.black12,
          children: <Widget>[
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    ClipPath(
                      clipper: TopWaveClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Theme.of(context).accentColor,
                                Theme.of(context).primaryColor,
                                
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.centerLeft),
                        ),
                        height: MediaQuery.of(context).size.height / 2.5,
                      ),
                    ),
                    Image.asset(
                      'assets/images/SmartFarm.png',
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ],
                ),
                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Smart Farm',
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontSize: 27,
                            color: Theme.of(context).primaryColor,
                            )),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Register',
                        style: TextStyle(
                          fontFamily: "Rowdies",
                            fontSize: 25,
                            color: Colors.black,
                            )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Full Name",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Username",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusColor: Colors.green,
                                  labelText: "Confirm Password",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "CNIC",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Phone Number",
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Address",
                                  hoverColor: Colors.green,
                                  // labelStyle: TextStyle(
                                  //     color: Colors.black45, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: new FlatButton(
                          onPressed: () {},
                          child: Text("Sign Up",
                              style: TextStyle(
                                fontFamily: "Rowdies",
                                  color: Colors.white,
                                  fontSize: 17,
                                  )),
                        )),
                  ],
                ),
                SizedBox(height: 25),
              ],
            )
          ]),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
