import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SaudiLawsScreen(),
    );
  }
}

class SaudiLawsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F2D2E), // Dark teal background
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png', // Replace with your logo asset path
                height: 80,
              ),
              SizedBox(height: 20),
              // Title
              Text(
                'Saudi Laws & Regulations',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Description List
              Expanded(
                child: ListView(
                  children: _buildLawCategories(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLawCategories() {
    List<Map<String, String>> categories = [
      {
        'title': 'Business Licensing Requirements',
        'description': 'Details on the required permits and approvals for starting a business.'
      },
      {
        'title': 'Taxation and Financial Compliance',
        'description': 'Overview of corporate tax laws, VAT regulations, and reporting requirements.'
      },
      {
        'title': 'Employment and Labor Laws',
        'description': 'Guidelines for hiring employees, worker benefits, and compliance.'
      },
      {
        'title': 'Industry-Specific Regulations',
        'description': 'Sector-specific laws for startups.'
      },
      {
        'title': 'Environmental Compliance',
        'description': 'Rules for environmental impact assessments.'
      },
    ];

    return categories.map((category) {
      return Card(
        color: Color(0xFF1A4645), // Slightly lighter teal
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category['title']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                category['description']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}