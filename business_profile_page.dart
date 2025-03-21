import 'package:flutter/material.dart';
import 'feature_display_page.dart'; // Import the Feature Display Page
import 'welcome_page.dart'; // Import Welcome Page

class BusinessProfilePage extends StatefulWidget {
  const BusinessProfilePage({super.key});

  @override
  _BusinessProfilePageState createState() => _BusinessProfilePageState();
}

class _BusinessProfilePageState extends State<BusinessProfilePage> {
  String? selectedSector;
  String? selectedRegion;

  final List<String> sectors = [
    "Agriculture",
    "Food & Beverage",
    "E-commerce",
    "Technology",
    "Healthcare",
    "Tourism & Hospitality",
    "Retail",
    "Finance & Banking",
    "Education",
    "Automobile",
    "Energy",
    "Legal & Consultancy",
  ];

  final List<String> regions = [
    "North",
    "South",
    "East",
    "West",
    "Central",
    "International",
  ];

  bool isSectorExpanded = false; // Controls visibility of the sector list
  bool isRegionExpanded = false; // Controls visibility of the region list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade400],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent extra white space
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Logo - Acts as Home Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          "Set Up Your Business Profile",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),

                        const Text(
                          "Please provide your business details to unlock personalized features!",
                          style: TextStyle(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // Sector Selection
                        _buildSelectionBox(
                          selectedSector ??
                              "Sector*", // Show selected sector or placeholder
                          sectors,
                          selectedSector,
                          (value) {
                            setState(() {
                              selectedSector = value;
                              isSectorExpanded =
                                  false; // Collapse the list after selection
                            });
                          },
                          isSectorExpanded,
                          () {
                            setState(() {
                              isSectorExpanded =
                                  !isSectorExpanded; // Toggle visibility
                              isRegionExpanded =
                                  false; // Collapse the other list
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        // Region Selection
                        _buildSelectionBox(
                          selectedRegion ??
                              "Region*", // Show selected region or placeholder
                          regions,
                          selectedRegion,
                          (value) {
                            setState(() {
                              selectedRegion = value;
                              isRegionExpanded =
                                  false; // Collapse the list after selection
                            });
                          },
                          isRegionExpanded,
                          () {
                            setState(() {
                              isRegionExpanded =
                                  !isRegionExpanded; // Toggle visibility
                              isSectorExpanded =
                                  false; // Collapse the other list
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        // Submit Button - Moves to Feature Display Page
                        ElevatedButton(
                          onPressed: () {
                            if (selectedSector != null &&
                                selectedRegion != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FeatureDisplayPage(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue.shade800,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Let's Start!",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Back Button 🔙 - Positioned in the top-left corner
          Positioned(
            top: 40, // Adjust the top position as needed
            left: 10, // Adjust the left position as needed
            child: IconButton(
              icon: Image.asset(
                'assets/images/back_icon.png',
                width: 24, // Adjust the size of the icon
                height: 24,
              ),
              iconSize: 24, // Set the icon size
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionBox(
    String title,
    List<String> options,
    String? selectedValue,
    Function(String) onSelect,
    bool isExpanded,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap, // Toggle list visibility on tap
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.2),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
            if (isExpanded) // Show the list only if expanded
              SizedBox(
                height: 150, // Fixed height for the list
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    String option = options[index];
                    return GestureDetector(
                      onTap: () {
                        onSelect(option); // Handle item selection
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        color: selectedValue == option
                            ? Colors.blue.shade700
                            : Colors.transparent,
                        child: Text(
                          option,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
