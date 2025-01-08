import 'package:flutter/material.dart';

void main() {
  runApp(const Answer3());
}

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 255, 38),
        ),
        useMaterial3: true,
      ),
      home: const ProductLayoutExample(),
    );
  }
}

class ProductLayoutExample extends StatelessWidget {
  const ProductLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: const Color.fromARGB(255, 116, 255, 82),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Category: Electronics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Product rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                imageUrl:
                    'https://www.istudio.store/cdn/shop/files/iPhone_13_Midnight_PDP_Position-1A_Midnight_Color__TH.jpg?v=1707275346&width=1445',
                name: 'Iphone',
                price: '40000 THB',
              ),
              ProductItem(
                imageUrl:
                    'https://www.istudio.store/cdn/shop/files/iPad_Air_11_M2_WiFi_Blue_PDP_Image_Position_1b__en-US_58ccb803-96b1-4b0e-86e4-cf4a11824824.jpg?v=1716469837&width=1445',
                name: 'Ipad',
                price: '20000 THB',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                imageUrl:
                    'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-pro-2-hero-select-202409_FMT_WHH?wid=750&hei=556&fmt=jpeg&qlt=90&.v=1724041668836',
                name: 'Airpod',
                price: '4000 THB',
              ),
              ProductItem(
                imageUrl:
                    'https://www.istudio.store/cdn/shop/files/macbook-air-m1-space-gray-001.jpg?v=1706069830',
                name: 'Macbook',
                price: '70000 THB',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}
