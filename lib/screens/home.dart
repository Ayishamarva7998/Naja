import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userToken;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  /// Load token from local storage
  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userToken = prefs.getString('userToken');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,))
     
      ),
      body: Column(
        children: [
          textfields(
            icon: Icons.location_on_outlined,
            txt1: 'Delivery to AI Saif Gardens',
          ),
          const SizedBox(height: 10),
          textfields(
            icon: Icons.search_outlined,
            txt1: 'Search for meat products',
          ),
          Row(
            children: const [
              Text('FEATURED FESTIVE DEALS'),
              SizedBox(width: 170),
              Text(
                'see all',
                style: TextStyle(color: Color.fromARGB(255, 26, 9, 184)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                  Container(
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
                    fit: BoxFit.cover,  
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 290),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    categoryitems1(
                      productname: 'Meat chicken &Fish',
                      imagepath1: 'assets/Meat,Chicken & Fish.png',
                      imgcolor: const Color.fromARGB(255, 238, 220, 219),
                    ),
                    const SizedBox(width: 18),
                    categoryitems1(
                      productname: 'Fruits & vegetables',
                      imagepath1: 'assets/fruits&veg.png',
                      imgcolor: const Color.fromARGB(255, 200, 242, 201),
                    ),
                    const SizedBox(width: 18),
                    categoryitems1(
                      productname: 'Dairy & Eggs',
                      imagepath1: 'assets/dairy&eggs.png',
                      imgcolor: const Color.fromARGB(255, 243, 239, 245),
                    ),
                    const SizedBox(width: 18),
                    categoryitems1(
                      productname: 'Bakery & Snacks',
                      imagepath1: 'assets/bakery&snacks.png',
                      imgcolor: const Color.fromARGB(255, 246, 223, 241),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    categoryitems2(
                      productname: 'Beverages',
                      imagepath: 'assets/beverages.png',
                      imgcolor: const Color.fromARGB(255, 239, 233, 216),
                    ),
                    const SizedBox(width: 18),
                    categoryitems2(
                      productname: 'Masalal & oil',
                      imagepath: 'assets/masala&oil.png',
                      imgcolor: const Color.fromARGB(255, 247, 242, 192),
                    ),
                    const SizedBox(width: 18),
                    categoryitems2(
                      productname: 'Sauce & Spreads',
                      imagepath: 'assets/sauceandspreads.png',
                      imgcolor: const Color.fromARGB(255, 248, 202, 188),
                    ),
                    const SizedBox(width: 18),
                    categoryitems2(
                      productname: 'Baby Basics',
                      imagepath: 'assets/baby&basics.png',
                      imgcolor: const Color.fromARGB(255, 234, 192, 240),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 260),
            child: Text('DEAL OF THE DAY'),
          ),
        ],
      ),
    );
  }

  
  Container categoryitems2({
    required String productname,
    required Color imgcolor,
    required String imagepath,
  }) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 219, 214, 214),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 45,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: imgcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Stack(children: [Image.asset(imagepath)]),
            ),
          ),
          Text(
            productname,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 8),
          ),
        ],
      ),
    );
  }

  Container categoryitems1({
    required String productname,
    required Color imgcolor,
    required String imagepath1,
  }) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 220, 217, 217),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 45,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: imgcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Stack(children: [Image.asset(imagepath1)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              productname,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }

  Container carouselslider({required String txt}) {
    return Container(
      height: 200,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 233, 232, 232),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
                width: 120,
                color: const Color.fromARGB(255, 228, 227, 222),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: const [
                      Text(
                        'celebrate',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 11,
                          color: Color.fromARGB(255, 209, 35, 23),
                        ),
                      ),
                      Text(
                        'National UAE Day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 22, 87, 24),
                        ),
                      ),
                      Text(
                        'WITH FESTIVE DEALS',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 180,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Deal Image Placeholder',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container textfields({
    required String txt1,
    required IconData icon,
  }) {
    return Container(
      height: 50,
      width: 350,
      color: const Color.fromARGB(255, 245, 240, 247),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 4, 33, 83),
          ),
          const SizedBox(width: 10),
          Text(
            txt1,
            style: const TextStyle(color: Color.fromARGB(255, 4, 33, 83)),
          ),
          const Icon(
            Icons.arrow_drop_down_sharp,
            color: Color.fromARGB(255, 4, 33, 83),
          ),
        ],
      ),
    );
  }
}
