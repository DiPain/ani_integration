import 'package:ani_integration/src/pages/home.dart';
import 'package:ani_integration/src/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MainMenu(),
    );
  }
}
