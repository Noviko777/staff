import 'package:flutter/material.dart';

import 'category_view.dart';

class CategoryHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: constraints.maxHeight,
          child: CategoryView(),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).hintColor.withOpacity(0.15))),
          ));
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;
}
