import 'package:flutter/material.dart';
import 'adminlist.dart';

class EcommerceScreen extends StatefulWidget {
  @override
  _EcommerceScreenState createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  List<Map<String, String>> ecommercePlatforms = [
    {
      "name": "Salla",
      "description": "An easy-to-use e-commerce platform designed for the Middle East.",
      "image": "assets/salla_logo.png",
    },
    {
      "name": "Zid",
      "description": "A scalable e-commerce platform for retailers and businesses in Saudi Arabia.",
      "image": "assets/zid_logo.png",
    },
    {
      "name": "Shopify",
      "description": "A leading e-commerce solution for online businesses worldwide.",
      "image": "assets/shopify_logo.png",
    },
    {
      "name": "WooCommerce",
      "description": "A customizable WordPress plugin for e-commerce stores.",
      "image": "assets/woocommerce_logo.png",
    }
  ];

  void _addEcommercePlatform() {
    setState(() {
      ecommercePlatforms.add({
        "name": "New Platform",
        "description": "A new e-commerce platform added by admin.",
        "image": "assets/default_logo.png", // Placeholder image
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3B46),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminListScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/logo.png', height: 80),
            const SizedBox(height: 10),
            const Text(
              "E-Commerce Platforms",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: ecommercePlatforms.length,
                itemBuilder: (context, index) {
                  return _buildEcommerceCard(index);
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addEcommercePlatform,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Add E-commerce Platform",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEcommerceCard(int index) {
    return Card(
      color: const Color(0xFF174D56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ecommercePlatforms[index]["image"]!,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/default_logo.png", height: 50);
              },
            ),
            const SizedBox(height: 10),
            Text(
              ecommercePlatforms[index]["name"]!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                ecommercePlatforms[index]["description"]!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
