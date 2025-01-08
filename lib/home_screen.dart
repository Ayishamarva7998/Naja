import 'package:flutter/material.dart';

class GroceryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chicken Curry Cut - Small Pieces',
      'weight': '500g',
      'price': 23.75,
      'originalPrice': 33.75,
      'discount': '20% OFF',
      'image': 'assets/maccream.jpg',
    },
    {
      'name': 'Fresh cut Tilapia Fillet',
      'weight': '300g',
      'price': 23.75,
      'originalPrice': 33.75,
      'discount': '50% OFF',
      'image': 'assets/maccream.jpg',
    },
    {
      'name': 'Lamb Mince',
      'weight': '400g',
      'price': 30.50,
      'originalPrice': 40.50,
      'discount': '25% OFF',
      'image': 'assets/maccream.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('homescreen'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Ensures 3 containers per row
                crossAxisSpacing: 2.0, // Horizontal spacing
                mainAxisSpacing: 2.0, // Vertical spacing
                childAspectRatio: 0.59, // Controls the container height
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['weight'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AED ${product['price'].toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                ),
                                Text(
                                  'AED ${product['originalPrice'].toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 50,
                              child: const Center(child: Text('Add',style:TextStyle(fontSize: 9) ,)),
                              decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)),
                              
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
