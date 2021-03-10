import 'package:FoodOrderingApp/home.dart';
import 'package:FoodOrderingApp/pages/get_profile.dart';
import 'package:FoodOrderingApp/pages/orderpage.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex = 0;
  List<Widget> pages;

  Widget currentPage;

  Home homepage;
  OrderPage orderPage;
  GetProfile getProfilePage;

  @override
  void initState() {
    super.initState();

    homepage = Home();
    orderPage = OrderPage();
    getProfilePage = GetProfile();
    pages = [homepage, orderPage, getProfilePage];
    currentPage = homepage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Orders"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
