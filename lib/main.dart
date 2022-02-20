import 'package:band_graphics/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (_) => HomePage(),
      },
      
    );
  }
}