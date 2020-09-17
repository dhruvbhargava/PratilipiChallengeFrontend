import 'package:flutter/material.dart';
import 'package:pratilipi_blog/constants.dart';
import '../common/customElevation.dart';
import '../services/AuthService.dart';
import 'HomeScreen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 47, 60, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // color: Color.fromRGBO(8, 17, 20, 1), //go to color
                color: Colors.white,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.45,
                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                ),
                child: Center(
                  child: Text(
                    'PratilipiBlog',
                    style: TextStyle(
                      color: Color.fromRGBO(8, 17, 20, 1),
                      fontSize: MediaQuery.of(context).size.height / 6,
                      fontFamily: 'aboutlove',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width * 0.25,
            child: CustomElevation(
              child: Card(
                margin: EdgeInsets.all(0),
//              color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 0,
                child: Container(
                  // color: Colors.pink,
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                    minHeight: MediaQuery.of(context).size.height * .6,
                    maxHeight: MediaQuery.of(context).size.height * .7,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 50,
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: MediaQuery.of(context).size.height / 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30,
                            left: 20,
                            right: 20,
                          ),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 25,
                              ),
                              isDense: true,
                              labelText: ' username',
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(color: Colors.black38),
                              hintText: 'ex:Taylor',
                              hintStyle: TextStyle(color: Colors.black12),
                              fillColor: Colors.black38,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                // borderSide: BorderSide(
                                //     color: Colors.black, width: 20),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                            ),
                            validator: (value) =>
                                value.isEmpty ? 'Cant be empty' : null,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 20,
                            left: 20,
                            right: 20,
                          ),
                          child: TextFormField(
                            controller: passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 25,
                              ),
                              isDense: true,
                              labelText: 'password',
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(color: Colors.black38),
                              hintText: ('Password'),
                              hintStyle: TextStyle(color: Colors.black12),
                              fillColor: Colors.black38,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                // borderSide: BorderSide(
                                //     color: Colors.black, width: 20),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Cant be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        //++++SUBMIT BUTTON+++++//
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            bottom: MediaQuery.of(context).size.height / 45,
                            left: MediaQuery.of(context).size.width * .1,
                            right: MediaQuery.of(context).size.width * .1,
                          ),
                          child: RaisedButton(
                            elevation: 0,
                            color: Color.fromRGBO(140, 205, 0, .8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 1, right: 1),
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            splashColor: Colors.white,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Signing In"),
                                            content: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ));
                                });
                                bool isAuthorized = await signIn(
                                    nameController.text, passController.text);
                                Navigator.pop(context);
                                if (isAuthorized) {
                                  userGlobal.Name = nameController.text;
                                  userGlobal.Name = passController.text;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Auth Failure!"),
                                            content:
                                                Text("wrong id or password! "),
                                          ));
                                }
                              }
                            },
                          ),
                        ),
                        Text('or', style: TextStyle(color: Colors.black38)),

                        //+++++++SIGN UP BUTTON+++++++//
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            bottom: MediaQuery.of(context).size.height / 45,
                            left: MediaQuery.of(context).size.width * .1,
                            right: MediaQuery.of(context).size.width * .1,
                          ),
                          child: RaisedButton(
                            elevation: 0,
                            color: Color.fromRGBO(8, 37, 50, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 1, right: 1),
                                  child: Text(
                                    'New user? Sign Up.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            splashColor: Colors.white,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Signing In"),
                                            content: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ));
                                });
                                bool createdSuccessfully = await signUp(
                                    nameController.text, passController.text);
                                Navigator.pop(context);
                                if (createdSuccessfully) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title:
                                                Text("Registration Success!"),
                                            content: Text(
                                                "Login With the New Credentials"),
                                          ));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title:
                                                Text("Registration Failure!"),
                                            content:
                                                Text("User Already Exists"),
                                          ));
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
