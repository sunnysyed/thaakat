import 'package:flutter/material.dart';
import 'screens/home/home.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Thaakat Foundation',
      routes: routes,
      home: new Home(),
      debugShowCheckedModeBanner: false,
    ));
  }
}