import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'LOGO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.white),
                TextField(decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 15, 6, 6),
                  hintText: 'Delivery to AI Saif Gardens',
                  
                ),)
           
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for "meat products"',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}