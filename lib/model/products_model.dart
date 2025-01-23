// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Product Model
// class Product {
//   final int id;
//   final String slug;
//   final String name;
//   final String description;
//   final int category;
//   final int brand;
//   final double price;
//   final String tags;
//   final double discountPrice;
//   final double discountPercentage;
//   final bool hasDiscount;
//   final bool isImageSame;
//   final bool isActive;

//   Product({
//     required this.id,
//     required this.slug,
//     required this.name,
//     required this.description,
//     required this.category,
//     required this.brand,
//     required this.price,
//     required this.tags,
//     required this.discountPrice,
//     required this.discountPercentage,
//     required this.hasDiscount,
//     required this.isImageSame,
//     required this.isActive,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       slug: json['slug'],
//       name: json['name'],
//       description: json['description'],
//       category: json['category'],
//       brand: json['brand'],
//       price: json['price'].toDouble(),
//       tags: json['tags'],
//       discountPrice: json['discount_price'].toDouble(),
//       discountPercentage: json['discount_percentage'].toDouble(),
//       hasDiscount: json['has_discount'],
//       isImageSame: json['is_image_same'],
//       isActive: json['is_active'],
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Product Model
class Product {
  final int id;
  final String slug;
  final String name;
  final String description;
  final int category;
  final int brand;
  final double price;
  final String tags;
  final double discountPrice;
  final double discountPercentage;
  final bool hasDiscount;
  final bool isImageSame;
  final bool isActive;

  Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.category,
    required this.brand,
    required this.price,
    required this.tags,
    required this.discountPrice,
    required this.discountPercentage,
    required this.hasDiscount,
    required this.isImageSame,
    required this.isActive,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      tags: json['tags'],
      discountPrice: json['discount_price'].toDouble(),
      discountPercentage: json['discount_percentage'].toDouble(),
      hasDiscount: json['has_discount'],
      isImageSame: json['is_image_same'],
      isActive: json['is_active'],
    );
  }
}