import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrendAnalysisScreen(),
    );
  }
}

class TrendAnalysisScreen extends StatefulWidget {
  @override
  _TrendAnalysisScreenState createState() => _TrendAnalysisScreenState();
}

class _TrendAnalysisScreenState extends State<TrendAnalysisScreen> {
  String? selectedSector;
  String? selectedRegion;

  final List<String> sectors = [
    'Food & Beverage', 'Retail', 'E-Commerce', 'Technology', 'Healthcare',
    'Manufacturing', 'Education', 'Real Estate', 'Agriculture', 'Logistics',
    'Tourism & Hospitality', 'Automotive', 'Legal & Consultancy'
  ];

  final List<String> regions = [
    'Riyadh', 'Jeddah', 'Dammam', 'Makkah', 'Madinah', 'Abha', 'Tabuk',
    'Hail', 'Najran', 'Eastern Borders'
  ];

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
                'assets/logo.png', // Replace with actual logo path
                height: 80,
              ),
              SizedBox(height: 20),
              // Title
              Text(
                'Trend Analysis',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Subtitle
              Text(
                'Select a sector and region to generate a comparative trend analysis graph tailored to your choices.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Dropdowns Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sector Dropdown
                  _buildDropdown('Sector', sectors, selectedSector, (String? value) {
                    setState(() {
                      selectedSector = value;
                    });
                  }),
                  SizedBox(width: 20),
                  // Region Dropdown
                  _buildDropdown('Region', regions, selectedRegion, (String? value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String? selectedItem, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xFF8C5A2F), // Brownish dropdown background
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Color(0xFF8C5A2F),
              value: selectedItem,
              hint: Text('Select $label', style: TextStyle(color: Colors.white)),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}