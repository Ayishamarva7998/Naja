import 'package:flutter/material.dart';

import 'package:naja/screens/cart_screen.dart';
import 'package:naja/screens/category_screen.dart';
import 'package:naja/screens/home.dart';

import 'package:naja/screens/profile.dart';

class bottombar extends StatefulWidget {
  const bottombar({super.key});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int myindex = 0;

  final pages = [HomeScreen(), CategoryScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: pages[myindex],
          bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,
      onTap: (index) {
        setState(() {
          myindex = index;
        });
      },
      currentIndex: myindex,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/homeicon.png'),
            label: ''
            
           ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/categoryicon.png'),
            label: ''
            
           ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/carticon.png'),
            label: ''
            
           ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/profileicon.png',height: 20,width: 20,
            color: myindex==3? Colors.black:const Color.fromARGB(255, 4, 57, 148),),
            label: ''
           
            ),
      ]),
        );
  }
}