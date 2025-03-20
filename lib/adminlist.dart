import 'package:flutter/material.dart';
import 'laws.dart'; // ✅ Import Saudi Laws Screen
import 'shipcompany.dart'; // ✅ Import Ship Company Screen
import 'ecommerce.dart'; // ✅ Import E-Commerce Screen
import 'features_screen.dart'; // ✅ Import Features Screen
import 'user_manual.dart'; // ✅ Import User Manual Screen
import 'trend_analysis.dart'; // ✅ Import Trend Analysis Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminListScreen(), // ✅ Entry screen
    );
  }
}

class AdminListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3B46), // Dark teal background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Manage and Oversee Business Tools",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // ✅ Navigate Back to Features Screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FeaturesScreen()),
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
            Image.asset('assets/logo.png', height: 80), // ✅ App Logo
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildOptionButton(
                    context,
                    "E-Commerce Platforms",
                    "Manage and update platform settings for seamless integration.",
                    screen: EcommerceScreen(), // ✅ Navigates to E-Commerce Screen
                  ),
                  _buildOptionButton(
                    context,
                    "Shipping Companies",
                    "Add, edit, and oversee shipping provider configurations.",
                    screen: ShipCompanyScreen(), // ✅ Navigates to Shipping Companies
                  ),
                  _buildOptionButton(
                    context,
                    "Trend Analysis",
                    "Refine and update data visualization for trend comparisons.",
                    screen: TrendAnalysisScreen(), // ✅ Navigates to Trend Analysis
                  ),
                  _buildOptionButton(
                    context,
                    "Saudi Laws and Regulations",
                    "Modify and maintain compliance resources for businesses.",
                    screen: SaudiLawsScreen(), // ✅ Navigates to Saudi Laws
                  ),
                  _buildOptionButton(
                    context,
                    "User Manual",
                    "Edit and update user guidance documentation.",
                    screen: UserManualScreen(), // ✅ Navigates to User Manual
                  ),
                  _buildOptionButton(
                    context,
                    "Entrepreneurs List",
                    "Review and manage the list of registered entrepreneurs.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String title, String subtitle,
      {Widget? screen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF174D56), // Dark green button color
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
          onTap: () {
            if (screen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            }
          },
        ),
      ),
    );
  }
}
