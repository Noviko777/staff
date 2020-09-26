import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:staff/my_staff_icons_icons.dart';

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
  //       body: NestedScrollView(
  //         controller: controller,
  //         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //           return <Widget>[
  //             new SliverAppBar(
  //               backgroundColor: Colors.white,
  //               centerTitle: true,
  //               title: Image.asset('assets/images/logo.png',
  //                   height: 40, fit: BoxFit.cover),
  //               pinned: true,
  //               floating: true,
  //               forceElevated: innerBoxIsScrolled,
  //               bottom: new TabBar(
  //                 labelColor: Color(0xFF222222),
  //                 indicatorColor: Color(0xFF222222),
  //                 indicatorWeight: 2.0,
  //                 tabs: <Tab>[
  //                   new Tab(text: "СКИДКИ"),
  //                   new Tab(text: "КАТАЛОГ"),
  //                 ],
  //               ),
  //             )
  //           ];
  //         },
  //         body: TabBarView(
  //           children: [
  //             Icon(Icons.directions_car),
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Flexible(
  //                   flex: 1,
  //                   child: CategoryView()
  //                 ),
  //                 Flexible(flex: 13, child: CatalogView(controller)),
  //               ],
  //             ),
  //           ],
  //         ),
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
        body: CustomScrollView(
    slivers: <Widget>[
       new SliverAppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Image.asset('assets/images/logo.png',
                    height: 40, fit: BoxFit.cover),
                pinned: true,
                floating: true,
                bottom: new TabBar(
                  labelColor: Color(0xFF222222),
                  indicatorColor: Color(0xFF222222),
                  indicatorWeight: 2.0,
                  tabs: <Tab>[
                    new Tab(text: "СКИДКИ"),
                    new Tab(text: "КАТАЛОГ"),
                  ],
                ),
              ),
              SliverPersistentHeader(
            delegate: MyDynamicHeader(),
            pinned: true,
          ),
      SliverFixedExtentList(
        itemExtent: 150.0,
        delegate: SliverChildListDelegate(
          [
          
            Container(color: Colors.red),
            Container(color: Colors.purple),
            Container(color: Colors.green),
            Container(color: Colors.orange),
            Container(color: Colors.yellow),
            Container(color: Colors.pink),
          ],
        ),
      ),
    ],
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

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  int index = 0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final Color color = Colors.primaries[index];
          final double percentage = (constraints.maxHeight - minExtent)/(maxExtent - minExtent);

          if (++index > Colors.primaries.length-1)
            index = 0;

          return Container(
 
            height: constraints.maxHeight,
            child:  CategoryView()
                
           
          );
        }
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;
}

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('ОТЗЫВЫ', MyStaffIcons.chat, Color(0xFF272727)),
  Destination('КАТАЛОГ', MyStaffIcons.cardigan, Color(0xFF272727)),
  Destination('КОРЗИНА', MyStaffIcons.shopping_cart, Color(0xFF272727)),
  Destination('ИЗБРАННОЕ', MyStaffIcons.heart, Color(0xFF272727)),
  Destination('БОЛЬШЕ', MyStaffIcons.spiral, Color(0xFF272727))
];

class CatalogView extends StatefulWidget {
  final ScrollController controller;

  CatalogView(this.controller);

  @override
  CatalogViewState createState() => CatalogViewState(controller);
}

class CatalogViewState extends State<CatalogView> {
  final ScrollController controller;

  CatalogViewState(this.controller);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: (index % 2 == 0) ? Colors.red : Colors.blue,
          );
        });
  }
}

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Категории"),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
