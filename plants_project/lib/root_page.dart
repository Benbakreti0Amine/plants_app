import 'package:flutter/material.dart';
import 'package:plants_project/constants.dart';
import 'package:plants_project/models/plant.dart';
import 'package:plants_project/ui/scan_page.dart';
import 'package:plants_project/ui/screens/cart_page.dart';
import 'package:plants_project/ui/screens/favorite_page.dart';
import 'package:plants_project/ui/screens/home_page.dart';
import 'package:plants_project/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> addedtocart = [];
  int _BottomIndex = 3;

  List<Widget> _widgetmethod() {
    return [
      HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedtocardPlants: addedtocart,
      ),
      ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> titles = [
    "home",
    "favorites",
    "shop",
    "profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titles[_BottomIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
              Icon(
                Icons.notifications,
                color: Constants.blackColor,
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _BottomIndex,
        children: _widgetmethod(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const ScanPage(),
            ),
          );
        },
        child: Image.asset("assets/images/code-scan.png", height: 30),
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(150.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _BottomIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _BottomIndex = index;
              final List<Plant> favorite = Plant.getFavoritedPlants();
              final List<Plant> added = Plant.addedToCartPlants();

               favorites = favorite;
               addedtocart = added;

            });
          }),
    );
  }
}
