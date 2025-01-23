// import 'package:flutter/material.dart';
// import 'package:naja/model/products_model.dart';
// import 'package:naja/service/product/product_service.dart';

// class ProductsScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<ProductsScreen> {
//   late Future<List<Product>> _productsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _productsFuture = ProductService.fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: _productsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No products available.'));
//           } else {
//             final products = snapshot.data!;

//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text('Price: \$${product.price}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


// Home Screen
import 'package:flutter/material.dart';
import 'package:naja/model/products_model.dart';
import 'package:naja/service/product/product_service.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;
  final int cityId = 2; 

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService.fetchProducts(cityId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available.'));
          } else {
            final products = snapshot.data!;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}



