import 'package:donation_app/database/authentication.dart';
import 'package:donation_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Authentication authenticate = Authentication();
  int bloodGroup = 1;
  String email = '';
  String pass = '';
  String name = '';
  String bloodType = "A+";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
    }else{
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
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                  height: 16,
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
                  height: 16,
                ),
                TextFormField(
                  onChanged: (input) {
                    setState(() => name = input);
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
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
                  height: 15,
                ),
                Container(
                  child: Text('Blood Type'),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('A+'),
                    Radio(
                  value: 1,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "A+";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                Column(children: <Widget>[
                    Text('A-'),
                    Radio(
                  value: 2,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "A-";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                  Column(children: <Widget>[
                    Text('B+'),
                    Radio(
                  value: 3,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "B+";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                  Column(children: <Widget>[
                    Text('B-'),
                    Radio(
                  value: 4,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "B-";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                ],),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('O+'),
                    Radio(
                  value: 5,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "O+";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                Column(children: <Widget>[
                    Text('O-'),
                    Radio(
                  value: 6,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "O-";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                  Column(children: <Widget>[
                    Text('AB+'),
                    Radio(
                  value: 7,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "AB+";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                  Column(children: <Widget>[
                    Text('AB-'),
                    Radio(
                  value: 8,
                  groupValue: bloodGroup,
                  activeColor: Colors.red,
                  onChanged: (value){
                  bloodType = "AB-";
                  //print(bloodType);
                  setState(() {
                    bloodGroup = value;
                  });
                  },)]),
                ],),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      if (email != "" && pass != "") {
                        dynamic result = await authenticate
                            .createUserWithEmailAndPassword(email, pass);
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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                  height: 16,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
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
}






