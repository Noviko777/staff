import 'package:flutter/material.dart';
import 'package:staff/my_staff_icons_icons.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int _bottomNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
    );
  }
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
