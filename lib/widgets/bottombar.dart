import 'package:flutter/material.dart';
import 'package:naja/controller/bottombar_controller.dart';
import 'package:naja/screens/cart_screen.dart';
import 'package:naja/screens/category_screen.dart';
import 'package:naja/screens/home.dart';
import 'package:naja/screens/profile.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: [
            HomeScreen(),
            CategoryScreen(),
            CartScreen(),
            ProfileScreen(),
          ][provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 17, 7, 165), 
            unselectedItemColor: const Color.fromARGB(255, 4, 57, 148), 
            onTap: (index) {
              provider.setCurrentIndex(index);  
            },
            currentIndex: provider.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  provider.currentIndex == 0
                      ? 'assets/homeicon.png'  
                      : 'assets/home.png',  // Unselected image
                  height: 20,
                  width: 20,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  provider.currentIndex == 1
                      ? 'assets/categoryfill.png'  // Selected image
                      : 'assets/categoryicon.png',  // Unselected image
                  height: 20,
                  width: 20,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  provider.currentIndex == 2
                      ? 'assets/cartfill.png'  // Selected image
                      : 'assets/carticon.png',  // Unselected image
                  height: 20,
                  width: 20,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  provider.currentIndex == 3
                      ? 'assets/profilefill.png'  // Selected image
                      : 'assets/profileicon.png',  // Unselected image
                  height: 20,
                  width: 20,
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
