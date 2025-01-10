import 'package:flutter/material.dart';
import 'package:naja/carousel.dart';
import 'package:naja/kkk.dart';
import 'package:naja/widgets/deals_widget.dart';
import 'package:naja/home.dart';
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
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home:HomeScreen() ,
    );
  }
}

