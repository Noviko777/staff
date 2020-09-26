import 'package:flutter/material.dart';
import 'package:staff/search_header.dart';

class CatalogView extends StatefulWidget {
  CatalogView();

  @override
  CatalogViewState createState() => CatalogViewState();
}

class CatalogViewState extends State<CatalogView> {
  CatalogViewState();

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     padding: EdgeInsets.all(0),
    //     itemExtent: 100.0,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         color: index % 2 == 0 ? Colors.green : Colors.indigo,
    //       );
    //     });
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: SearchHeader(),
          pinned: false,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.green : Colors.indigo,
                height: 100,
              );
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}
