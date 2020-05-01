import 'package:donation_app/database/authentication.dart';
import 'package:donation_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: Authentication().user,
          child: MaterialApp(
        title: 'Donation',
        home: Login(),
      ),
    );
  }
}
