import 'package:flutter/material.dart';

class SearchHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: TextField(
                        showCursor: true,
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            labelStyle: TextStyle(fontSize: 14),
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 10, bottom: 16, top: 0, right: 15),
                            hintText: "Введите название или артикул товара"),
                      )),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.search)),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => false;

  @override
  double get maxExtent => 55.0;

  @override
  double get minExtent => 55.0;
}
