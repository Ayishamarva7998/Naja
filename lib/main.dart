import 'package:flutter/material.dart';
import 'package:naja/controller/bottombar_controller.dart';
import 'package:naja/controller/location_controller.dart';
import 'package:naja/kkk.dart';
import 'package:naja/screens/category_screen.dart';
import 'package:naja/screens/categorydetails.dart';
import 'package:naja/screens/products_screen.dart';
import 'package:naja/screens/sub_ui.dart';
import 'package:naja/screens/subcategory_screen.dart';
import 'package:naja/screens/home.dart';
import 'package:naja/screens/subsubscreen.dart';
import 'package:naja/widgets/bottombar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()), 
        ChangeNotifierProvider(create: (_)=>BottomBarProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Bottombar(),
    );
  }
}
