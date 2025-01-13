import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StoreListScreen(),
    );
  }
}

// Store List Screen
class StoreListScreen extends StatelessWidget {
  const StoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
      ),
      body: const StoreListContent(),
    );
  }
}

// Store Model
class Store {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String deliveryTime;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      rating: json['rating'].toDouble(),
      deliveryTime: json['delivery_time'],
    );
  }
}

// Store Data
final List<Store> storesList = [
  Store(
    id: '1',
    name: 'Green Valley Organics',
    description: 'Fresh and healthy food',
    imageUrl: 'assets/images/store_image1.jpg',
    rating: 4.5,
    deliveryTime: '30-45 min',
  ),
  Store(
    id: '2',
    name: 'Fresh Market',
    description: 'Quality groceries and fresh produce',
    imageUrl: 'assets/images/store_image2.jpg',
    rating: 4.2,
    deliveryTime: '20-35 min',
  ),
  Store(
    id: '3',
    name: 'Organic Paradise',
    description: 'Organic and natural foods',
    imageUrl: 'assets/images/store_image3.jpg',
    rating: 4.7,
    deliveryTime: '25-40 min',
  ),
];

// Store Card Widget
class StoreCard extends StatelessWidget {
  final String storeName;
  final String description;
  final String imageUrl;
  final double rating;
  final String deliveryTime;

  const StoreCard({
    super.key,
    required this.storeName,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
             
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Overlapping store name container
              Positioned(
                bottom: -20,
                left: 8,
                right: 8,
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    storeName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24), // Space for overlapping container
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 4),
                    Text(deliveryTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Store List Content Widget
class StoreListContent extends StatefulWidget {
  const StoreListContent({super.key});

  @override
  State<StoreListContent> createState() => _StoreListContentState();
}

class _StoreListContentState extends State<StoreListContent> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FilterChip(
                label: const Text('All'),
                selected: selectedFilter == 'All',
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = 'All';
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Within 5km'),
                selected: selectedFilter == 'Within 5km',
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = 'Within 5km';
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Top Rated'),
                selected: selectedFilter == 'Top Rated',
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = 'Top Rated';
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Most visited'),
                selected: selectedFilter == 'Most visited',
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = 'Most visited';
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Open now'),
                selected: selectedFilter == 'Open now',
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = 'Open now';
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: storesList.length,
            itemBuilder: (context, index) {
              final store = storesList[index];
              return StoreCard(
                storeName: store.name,
                description: store.description,
                imageUrl: store.imageUrl,
                rating: store.rating,
                deliveryTime: store.deliveryTime,
              );
            },
          ),
        ),
      ],
    );
  }
}