import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String,dynamic>> categoryItem = [
    {
     'image': 'assets/masala&oil.png',
     'name':'Meat chicken & Fish',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/fruits&veg.png',
     'name':'Frits & vegitables',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/dairy&eggs.png',
     'name':'Dairy & Eggs',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/bakery&snacks.png',
     'name':'Bakery & Snacks',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/beverages.png',
     'name':'Beverages',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/masala&oil.png',
     'name':'Masal & Oil',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/sauceandspreads.png',
     'name':'Sauce & Spreads',
     'colors':'Colors.yellow'
     },
      {
     'image': 'assets/baby&basics.png',
     'name':'Baby & Basics',
     'colors':'Colors.yellow'
     }

    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: GoogleFonts.montserrat(
                fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 14,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1),
            itemCount: categoryItem.length,
            itemBuilder: (context, index) {
              final item =categoryItem[index];
              return Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 245, 244, 243)),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                           
                              image: DecorationImage(
                                  image:
                                   AssetImage(item['image'])
                                   )),
                        ),
                        Text(
                          item['name'],
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}