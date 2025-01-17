import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_outlined),
          title: Center(child: const Text('Categories')),
          backgroundColor: Colors.white,
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryItem(topImage: "assets/Rectangle 5-2.png", bottomImage: "assets/coin.png", name: "Top Offers"),
                  categoryItem(topImage: "assets/grocery.png", bottomImage: "assets/grocery_icon.png", name: "Grocery"),
                  categoryItem(topImage: "assets/phones.png", bottomImage: "assets/mobile_icon.png", name: "Mobiles"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryItem(topImage: "assets/fashion.png", bottomImage: "assets/fashion_icon.png", name: "Fashion"),
                  categoryItem(topImage: "assets/electronics.png", bottomImage: "assets/electronics_icon.png", name: "Electronics"),
                  categoryItem(topImage: "assets/home.png", bottomImage: "assets/home_icon.png", name: "Home"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryItem(topImage: "assets/personal_care.png", bottomImage: "assets/care_icon.png", name: "Personal Care"),
                  categoryItem(topImage: "assets/appliances.png", bottomImage: "assets/appliances_icon.png", name: "Appliances"),
                  categoryItem(topImage: "assets/toys.png", bottomImage: "assets/baby_icon.png", name: "Toys & Baby"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryItem(topImage: "assets/furniture.png", bottomImage: "assets/furniture_icon.png", name: "Furniture"),
                  categoryItem(topImage: "assets/flights.png", bottomImage: "assets/travel_icon.png", name: "Flights"),
                  categoryItem(topImage: "assets/insurance.png", bottomImage: "assets/insurance_icon.png", name: "Insurance"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  categoryItem(topImage: "assets/gift_cards.png", bottomImage: "assets/gift_icon.png", name: "Gift Cards"),
                  const SizedBox(width: 20),
                  categoryItem(topImage: "assets/medicines.png", bottomImage: "assets/health_icon.png", name: "Medicines"),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column categoryItem({required String topImage, required String bottomImage, required String name}) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 110,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E5F5), 
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
             
              Positioned(
               top : -50,
                child: Container(
                  height: 160,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(topImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            
              Positioned(
                bottom: 25,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bottomImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 68,),
                child: Text('Meat',style: TextStyle(fontSize: 10),),
              )
            ],
          ),
          
        ),
        const SizedBox(height: 8),
        // Text(
        //   name,
        //   style: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}