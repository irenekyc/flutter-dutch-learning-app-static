import 'package:flutter/material.dart';
import 'package:learn_dutch_app/widgets/body.dart';
import '../widgets/collection.dart';
import '../widgets/me.dart';
import '../style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomSelectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30),
        title: Text("Home",
            style: TextStyle(height: 1.5, fontWeight: FontWeight.w500)),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.library_books, size: 30),
          title: Text("Collections",
              style: TextStyle(height: 1.5, fontWeight: FontWeight.w500))),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline, size: 30),
        title: Text("Me",
            style: TextStyle(height: 1.5, fontWeight: FontWeight.w500)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: buildBottomNavBarItems(),
            backgroundColor: primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            currentIndex: bottomSelectedIndex,
            onTap: (index) {
              bottomTapped(index);
            }),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              bottomSelectedIndex = index;
            });
          },
          children: <Widget>[Body(), Collections(), Me()],
        ));
  }

  bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }
}
