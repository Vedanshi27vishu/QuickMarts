// ignore: file_names
import 'package:ecommerce/features/authentication/models/Category_model.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Favourite.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Home.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Shop.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/profile.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  final UserModel usermodel;
  
  const NavigationMenu({super.key, required this.usermodel,});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Home(usermodel: widget.usermodel,),
      const Favourite(),
      const Shop(),
      Profile(usermodel: widget.usermodel),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ecolor.primary,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: 'Profile',
            ),
          ]),
      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),
    );
  }
}
