import 'package:flutter/material.dart';

// ignore: camel_case_types
class signupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signupPage();
}

// ignore: camel_case_types
class _signupPage extends State<signupPage> {


  var _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  String _fullname = "";
  String _username = "";
  String _email = "";
  String _password = "";
  String _cnic = "";
  String _phone = "";
  String _address = "";


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
                     Form(
                          autovalidate: true,
                          key: _formKey,
                          child: new Column(
                            children: <Widget>[
                              //  Padding(padding: EdgeInsets.all(10.0)),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _fullname = value;
                                      });
                                      print("_fullname: + $_fullname");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'Full Name',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                               Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _username = value;
                                      });
                                      print("Username: + $_username");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'Username',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                               Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _email = value;
                                      });
                                      print("email: + $_email");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'Email',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _password = value;
                                      });
                                      print("password: + $_password");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: 'Password',
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          passwordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Theme.of(context).primaryColor,
                                          // size: 16.0,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: passwordVisible,
                                     autovalidate: true,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _password = value;
                                      });
                                      print("password: + $_password");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: 'Confirm Password',
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          passwordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Theme.of(context).primaryColor,
                                          // size: 16.0,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: passwordVisible,
                                     autovalidate: true,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                               Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _cnic = value;
                                      });
                                      print("CNIC: + $_cnic");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'CNIC',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                               Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _phone = value;
                                      });
                                      print("Phone: + $_phone");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'Phone Number',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),
                               Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: new TextFormField(
                                    onSaved: (value) {
                                      setState(() {
                                        _address = value;
                                      });
                                      print("Address: + $_address");
                                    },
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue[900], //this has no effect
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      //  helperText: 'Username',
                                      hintText: 'Address',
                                    ),
                                    keyboardType: TextInputType.text,
                                    //validator: _validateEmail,
                                  ),
                                ),
                                //height: 63.0,
                              ),

                            ],
                          ),
                        ),
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
