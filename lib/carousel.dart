import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: [
            'assets/Festive Banner.png',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    i,
                    fit: BoxFit.cover,  // Ensures the image fits the container
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
