import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staff/catalog_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Color(0xFF222222), // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogPage(),
      theme: ThemeData(fontFamily: "Ubuntu"),
    );
  }
}
