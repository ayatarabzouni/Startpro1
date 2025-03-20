import 'package:flutter/material.dart';

class SalesEstimationScreen extends StatefulWidget {
  @override
  _SalesEstimationScreenState createState() => _SalesEstimationScreenState();
}

class _SalesEstimationScreenState extends State<SalesEstimationScreen> {
  String? selectedMarketSize;
  String? selectedConversionRate;
  final TextEditingController marketingBudgetController = TextEditingController();
  final TextEditingController pricePointController = TextEditingController();
  final TextEditingController customerReachController = TextEditingController();
  String estimatedSales = "";

  final List<String> marketSizes = [
    'Less than 1,000',
    '1,000-5,000',
    '5,000-10,000',
    '10,000-50,000',
    'More than 50,000'
  ];
  final List<String> conversionRates = ['1%', '2%', '3%', '4%', '5%', '10%', '15%', '20%'];

  void _calculateSales() {
    if (selectedMarketSize == null || selectedConversionRate == null || 
        marketingBudgetController.text.isEmpty || 
        pricePointController.text.isEmpty || 
        customerReachController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    // Convert input values to numbers
    double marketSize = double.parse(selectedMarketSize!.replaceAll(RegExp(r'[^0-9]'), ''));
    double conversionRate = double.parse(selectedConversionRate!.replaceAll('%', '')) / 100;
    double pricePoint = double.tryParse(pricePointController.text) ?? 0.0;
    double customerReach = double.tryParse(customerReachController.text) ?? 0.0;

    // Sales estimation formula
    double estimatedRevenue = (marketSize * conversionRate * pricePoint) + customerReach;

    setState(() {
      estimatedSales = "Estimated Revenue: ${estimatedRevenue.toStringAsFixed(2)} SAR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3B46), // Dark teal background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sales Forecasting",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // ✅ Back to previous screen
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 80), // ✅ App Logo
            const SizedBox(height: 15),
            const Text(
              'Calculate Estimated Sales',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            const Text(
              'Provide business details to estimate revenue potential.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Dropdowns Row
            Row(
              children: [
                Expanded(
                  child: _buildDropdown('Market Size', marketSizes, selectedMarketSize, (value) {
                    setState(() => selectedMarketSize = value);
                  }),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildDropdown('Conversion Rate', conversionRates, selectedConversionRate, (value) {
                    setState(() => selectedConversionRate = value);
                  }),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Input Fields
            _buildTextField('Marketing Budget (SAR)', marketingBudgetController),
            _buildTextField('Price Point (SAR)', pricePointController),
            _buildTextField('Projected Customer Reach', customerReachController),

            const SizedBox(height: 20),

            // Calculate Button
            ElevatedButton(
              onPressed: _calculateSales,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Calculate Sales',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            // Estimated Sales Result
            Text(
              estimatedSales,
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedItem, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A4645),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: const Color(0xFF1A4645),
              value: selectedItem,
              hint: Text('Select $label', style: const TextStyle(color: Colors.white)),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color(0xFF1A4645),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
