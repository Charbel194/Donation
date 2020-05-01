import 'package:donation_app/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:donation_app/database/authentication.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Authentication authenticate = Authentication();
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          Expanded(
                      child: Center(
                child: Image.asset(
              'images/Blood_Icon.png',
              color: Colors.red,
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (input) {
                    setState(() => email = input);
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  onChanged: (input) {
                    setState(() => pass = input);
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      //Add Recovery
                    },
                    child: Text(
                      "Forgot Your Password ?",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      if (email != "" && pass != "") {
                        dynamic result = await authenticate
                            .signInEmailAndPassword(email, pass);
                        if (result == null) {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Failed To Sign In'),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  );
                                });
                          });
                        }
                      }else{
                        setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Please enter an email and password'),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  );
                                });
                          });
                      }
                    },
                    padding: EdgeInsets.all(0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.redAccent,
                            Colors.red,
                            Colors.redAccent,
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                            maxWidth: double.infinity, minHeight: 50),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      //Facebook Login
                    },
                    color: Colors.indigo.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/Facebook.png",
                          height: 18.0,
                          width: 18.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Connect with Facebook",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      //Facebook Login
                    },
                    color: Colors.indigo.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/Google.png",
                          height: 18.0,
                          width: 18.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Connect with Google",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Not a user? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
