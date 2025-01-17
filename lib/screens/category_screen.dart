import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
   Categories({super.key});

  // Mock data for now (replace this with API response later)
  final List<Map<String, String>> categories = [
    {"topImage": "assets/Rectangle 5-2.png", "bottomImage": "assets/babybasics.png", "text1": "Top Offers", "text2": ""},
    {"topImage": "assets/grocery.png", "bottomImage": "assets/grocery_icon.png", "text1": "Grocery", "text2": ""},
    {"topImage": "assets/phones.png", "bottomImage": "assets/mobile_icon.png", "text1": "Mobiles", "text2": ""},
    {"topImage": "assets/fashion.png", "bottomImage": "assets/fashion_icon.png", "text1": "Fashion", "text2": ""},
    {"topImage": "assets/electronics.png", "bottomImage": "assets/electronics_icon.png", "text1": "Electronics", "text2": ""},
    {"topImage": "assets/home.png", "bottomImage": "assets/home_icon.png", "text1": "Home", "text2": ""},
    {"topImage": "assets/personal_care.png", "bottomImage": "assets/care_icon.png", "text1": "Personal Care", "text2": ""},
    {"topImage": "assets/appliances.png", "bottomImage": "assets/appliances_icon.png", "text1": "Appliances", "text2": ""},
    {"topImage": "assets/toys.png", "bottomImage": "assets/baby_icon.png", "text1": "Toys", "text2": "Baby"},
    {"topImage": "assets/furniture.png", "bottomImage": "assets/furniture_icon.png", "text1": "Furniture", "text2": ""},
    {"topImage": "assets/flights.png", "bottomImage": "assets/travel_icon.png", "text1": "Flights", "text2": ""},
    {"topImage": "assets/insurance.png", "bottomImage": "assets/insurance_icon.png", "text1": "Insurance", "text2": ""},
    {"topImage": "assets/gift_cards.png", "bottomImage": "assets/gift_icon.png", "text1": "Gift Cards", "text2": ""},
    {"topImage": "assets/medicines.png", "bottomImage": "assets/health_icon.png", "text1": "Medicines", "text2": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_outlined),
          title: const Center(child: Text('Categories')),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              (categories.length / 3).ceil(),
              (rowIndex) {
                final rowItems = categories.skip(rowIndex * 3).take(3).toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: rowItems.map((item) {
                      return categoryItem(
                        topImage: item["topImage"]!,
                        bottomImage: item["bottomImage"]!,
                        text1: item["text1"]!,
                        text2: item["text2"]!,
                      );
                    }
                    // else{
                    //   return SizedBox(hight:110,width:
                    //   110)

                    // }
                    ).toList(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Dynamic categoryItem widget
  Column categoryItem({
    required String topImage,
    required String bottomImage,
    required String text1,
    required String text2,
  }) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E5F5),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -50,
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
                bottom: 30,
                child: Container(
                  height: 65,
                  width: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bottomImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Column(
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
