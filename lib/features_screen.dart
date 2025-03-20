import 'package:flutter/material.dart';
import 'adminlist.dart'; // ✅ Ensure AdminListScreen is accessible
import 'trendanalysis_user.dart'; // ✅ Import Trend Analysis User Screen
import 'ecommerce_user.dart'; // ✅ Import E-Commerce User Screen
import 'salesforcasting.dart'; // ✅ Import Sales Forecasting Screen
import 'logogenerator.dart';
import 'laws_user.dart';
import 'usermanual_user.dart'; // ✅ Import the User Manual User Screen

class FeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3B46), // Dark teal background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminListScreen()), // ✅ Back to Admin List
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
            Image.asset(
              'assets/logo.png', // ✅ Ensure you have this logo in assets
              height: 80,
            ),
            const SizedBox(height: 10),
            const Text(
              "Discover Tools to Kickstart Your Business",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildFeatureButton(
                    context,
                    "Name Generator & Trademark Checker",
                    "Create unique business names and verify trademarks instantly",
                  ),
                  _buildFeatureButton(
  context,
  "Logo Generator",
  "Design a professional logo that reflects your brand identity",
  screen: LogoGeneratorScreen(),  // ✅ You missed this!
),

                  _buildFeatureButton(
                    context,
                    "E-Commerce Platforms",
                    "Explore top platforms to set up and grow your online store",
                    screen: ECommerceUserScreen(), // ✅ Navigates to E-Commerce User Screen
                  ),
                  _buildFeatureButton(
                    context,
                    "Shipping Companies",
                    "Compare reliable shipping options for your product delivery",
                  ),
                  _buildFeatureButton(
                    context,
                    "Trend Analysis",
                    "Stay ahead with insights into industry trends and customer behavior",
                    screen: TrendAnalysisScreen(), // ✅ Navigates to Trend Analysis User Screen
                  ),
                  _buildFeatureButton(
                    context,
                    "Saudi Laws and Regulations",
                    "Access key legal guidelines and compliance resources in Saudi Arabia",
                  ),
                  _buildFeatureButton(
                    context,
                    "Sales Forecasting",
                    "Estimate future sales and revenue trends based on market data",
                    screen: SalesEstimationScreen(), // ✅ Navigates to Sales Forecasting Screen
                  ),
                  _buildFeatureButton(
  context,
  "User Manual",
  "Comprehensive guide to help you navigate and use platform features",
  screen: UserManualUserScreen(), // ✅ Correct navigation added
),


                  _buildFeatureButton(
  context,
  "Saudi Laws and Regulations",
  "Access key legal guidelines and compliance resources in Saudi Arabia",
  screen: SaudiLawsScreen(), // ✅ Correctly navigates now
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String title, String subtitle, {Widget? screen}) {
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

