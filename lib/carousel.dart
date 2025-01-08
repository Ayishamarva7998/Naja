import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

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
                    
                    // width: 100,),
                    'assets/maccream.jpg',
        
                    
                  ].map(
                    (i) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          // width: 410,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Image.asset(i),
                            ],
                          ),
                        );
                      });
                    },
                  ).toList(),
                ),
              ),
    );
  }
}