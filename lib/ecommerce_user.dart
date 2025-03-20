import 'package:flutter/material.dart';

class ECommerceUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2D2E), // Dark teal background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // ✅ Navigates back to FeaturesScreen
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png', // Replace with actual logo path
                height: 80,
              ),
              const SizedBox(height: 20),
              // Title
              const Text(
                'E-Commerce Platforms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Content List
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildPlatformDescriptions(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPlatformDescriptions() {
    List<Map<String, String>> platforms = [
      {
        'title': 'Shopify',
        'description': 'A leading e-commerce solution for businesses of all sizes. Features include customizable templates, inventory management, and integrated payment processing.',
        'link': 'https://www.shopify.com',
        'image': 'assets/shopify_logo.png'
      },
      {
        'title': 'WooCommerce',
        'description': 'A flexible WordPress plugin that allows businesses to turn their websites into full-fledged e-commerce stores.',
        'link': 'https://woocommerce.com',
        'image': 'assets/woocommerce_logo.png'
      },
      {
        'title': 'salla',
        'description': 'A scalable e-commerce platform offering advanced customization, multi-store capabilities, and enterprise-level features.',
        'link': 'https://salla.com',
        'image': 'assets/salla_logo.png'
      },
    ];

    return platforms.map((platform) {
      return Card(
        color: const Color(0xFF1A4645), // Slightly lighter teal
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    platform['image']!,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    platform['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                platform['description']!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Implement link opening logic
                },
                child: Text(
                  platform['link']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
