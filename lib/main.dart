import 'package:efinance/Login.dart';
import 'package:efinance/Home.dart';
import 'package:flutter/material.dart';

//Lastly we come to our main app
class MyApp extends StatelessWidget {
  // This is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'E-Finance',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new HomePage(),
    );
  }
}

//Then we run our app
void main() => runApp(new MyApp());