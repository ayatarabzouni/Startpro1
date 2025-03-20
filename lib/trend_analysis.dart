import 'package:flutter/material.dart';
import 'adminlist.dart'; // ✅ Back button navigates to AdminListScreen

class TrendAnalysisScreen extends StatefulWidget {
  @override
  _TrendAnalysisScreenState createState() => _TrendAnalysisScreenState();
}

class _TrendAnalysisScreenState extends State<TrendAnalysisScreen> {
  String? selectedSector;
  String? selectedRegion;

  final List<String> sectors = [
    "Agriculture", "Retail", "E-commerce", "Technology", "Finance", "Healthcare",
    "Manufacturing", "Logistics", "Real Estate", "Energy", "Education",
    "Food & Beverages", "Pharmaceuticals", "Automobile", "Legal & Consultancy"
  ];

  final List<String> regions = [
    "Riyadh", "Jeddah", "Mecca", "Medina", "Dammam", "Khobar",
    "Tabuk", "Abha", "Hail", "Najran", "Al Jawf", "Northern Borders"
  ];

  void _updateGraphs() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Graphs updated successfully!"))
    );
  }

  void _downloadGraphs() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Graphs downloaded!"))
    );
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
            Image.asset('assets/logo.png', height: 80), // ✅ App Logo
            const SizedBox(height: 10),
            const Text(
              "Trend Analysis",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Select a sector and region to generate a comparative trend analysis graph tailored to your choices.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Dropdown Selectors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDropdown("Sector", sectors, selectedSector, (value) {
                  setState(() => selectedSector = value);
                }),
                _buildDropdown("Region", regions, selectedRegion, (value) {
                  setState(() => selectedRegion = value);
                }),
              ],
            ),

            const SizedBox(height: 30),

            // Buttons for Update & Download
            ElevatedButton(
              onPressed: _updateGraphs,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Update Graphs"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _downloadGraphs,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Download Graphs"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.brown, // ✅ Matches UI style
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.brown,
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
            hint: const Text("Select", style: TextStyle(color: Colors.white70)),
            underline: Container(),
          ),
        ),
      ],
    );
  }
}
