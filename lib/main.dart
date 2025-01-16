import 'package:flutter/material.dart';
import 'package:naja/screens/ui.dart';
import 'package:naja/widgets/carousel.dart';
import 'package:naja/widgets/delete.dart';
import 'package:naja/kkk.dart';
import 'package:naja/screens/location_screen.dart';
import 'package:naja/screens/profile.dart';
import 'package:naja/widgets/deals_widget.dart';
import 'package:naja/screens/home.dart';
import 'package:naja/widgets/geolocator_widget.dart';
import 'package:naja/widgets/stores_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naja',
   
      home:LocationUI() ,
    );
  }
}

