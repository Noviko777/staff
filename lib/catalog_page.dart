import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:staff/my_staff_icons_icons.dart';

import 'catalog_view.dart';
import 'category_header.dart';
import 'search_header.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 1;
  final controller = ScrollController();
  // TabController tabController;

  @override
  void initState() {
    super.initState();
    //  tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       backgroundColor: Colors.white,
  //       body: CustomScrollView(
  //         slivers: <Widget>[
  //           new SliverAppBar(
  //             elevation: 0.0,
  //             backgroundColor: Colors.white,
  //             centerTitle: true,
  //             title: Image.asset('assets/images/logo.png',
  //                 height: 40, fit: BoxFit.cover),
  //             pinned: true,
  //             floating: true,
  //             bottom: new TabBar(
  //               labelColor: Color(0xFF222222),
  //               indicatorColor: Color(0xFF222222),
  //               indicatorWeight: 2.5,
  //               labelStyle: TextStyle(
  //                   color: Colors.black,
  //                   fontFamily: "Ubuntu",
  //                   fontWeight: FontWeight.w400,
  //                   letterSpacing: 1.0,
  //                   fontSize: 13.0),
  //               tabs: <Tab>[
  //                 new Tab(text: "СКИДКИ"),
  //                 new Tab(text: "КАТАЛОГ"),
  //               ],
  //             ),
  //           ),
  //           SliverPersistentHeader(
  //             delegate: MyDynamicHeader(),
  //             pinned: true,
  //           ),
  //           CatalogView(),
  //         ],
  //       ),
  //       bottomNavigationBar: BottomNavigationBar(
  //         type: BottomNavigationBarType.fixed,
  //         selectedItemColor: Color(0xFF272727),
  //         unselectedItemColor: Color(0xFF898989),
  //         selectedFontSize: 10.0,
  //         unselectedFontSize: 10.0,
  //         currentIndex: _bottomNavIndex,
  //         onTap: (int index) {
  //           setState(() {
  //             _bottomNavIndex = index;
  //           });
  //         },
  //         items: allDestinations.map((Destination destination) {
  //           return BottomNavigationBarItem(
  //               icon: Icon(destination.icon),
  //               backgroundColor: Color(0xFFEEEEEE),
  //               title: Padding(
  //                 padding: const EdgeInsets.only(top: 8.0),
  //                 child: Text(destination.title),
  //               ));
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Image.asset('assets/images/logo.png',
                    height: 40, fit: BoxFit.cover),
                pinned: true,
                floating: true,
                bottom: new TabBar(
                  labelColor: Color(0xFF222222),
                  indicatorColor: Color(0xFF222222),
                  indicatorWeight: 2.5,
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                      fontSize: 13.0),
                  tabs: <Tab>[
                    new Tab(text: "СКИДКИ"),
                    new Tab(text: "КАТАЛОГ"),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: CategoryHeader(),
                pinned: true,
              )
            ];
          },
          body: TabBarView(
            children: [Icon(Icons.camera), CatalogView()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF272727),
          unselectedItemColor: Color(0xFF898989),
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          currentIndex: _bottomNavIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon),
                backgroundColor: Color(0xFFEEEEEE),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(destination.title),
                ));
          }).toList(),
        ),
      ),
    );
  }
}

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('ОТЗЫВЫ', MyStaffIcons.chat),
  Destination('КАТАЛОГ', MyStaffIcons.cardigan),
  Destination('КОРЗИНА', MyStaffIcons.shopping_cart),
  Destination('ИЗБРАННОЕ', MyStaffIcons.heart),
  Destination('БОЛЬШЕ', MyStaffIcons.spiral)
];
