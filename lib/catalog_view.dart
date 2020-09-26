import 'package:flutter/material.dart';

class CatalogView extends StatefulWidget {
  CatalogView();

  @override
  CatalogViewState createState() => CatalogViewState();
}

class CatalogViewState extends State<CatalogView> {
  CatalogViewState();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          return Container(
            color: index % 2 == 0 ? Colors.green : Colors.indigo,
          );
        });
  }
}
