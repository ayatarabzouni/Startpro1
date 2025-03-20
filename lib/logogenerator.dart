import 'package:flutter/material.dart';
import 'features_screen.dart'; // ✅ Import the Features Screen for navigation

class LogoGeneratorScreen extends StatefulWidget {
  @override
  _LogoGeneratorScreenState createState() => _LogoGeneratorScreenState();
}

class _LogoGeneratorScreenState extends State<LogoGeneratorScreen> {
  final TextEditingController _businessNameController = TextEditingController();
  String? _selectedStyle;
  Color _selectedColor = Colors.blue;

  final List<String> styles = ["Minimalist", "Typography", "Iconic", "Emblem", "Modern"];

  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick a Color"),
          content: Wrap(
            children: Colors.primaries.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _generateLogo() {
    if (_businessNameController.text.isEmpty || _selectedStyle == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all required details.")),
      );
      return;
    }
    if (_businessNameController.text.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Business name must be under 15 characters.")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Generating logo for '${_businessNameController.text}'...")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2D3B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FeaturesScreen()), // ✅ Navigate back to Features
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png', // ✅ Ensure this logo exists in assets
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Logo Generator",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _businessNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Business Name",
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "Enter Business Name",
                hintStyle: const TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "*Note: Keep the business name under 15 characters for best design results.",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.black87,
              value: _selectedStyle,
              items: styles.map((style) {
                return DropdownMenuItem(
                  value: style,
                  child: Text(style, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStyle = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Style",
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickColor,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Selected Color", style: TextStyle(color: Colors.white, fontSize: 16)),
                    Icon(Icons.color_lens, color: _selectedColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _generateLogo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "Generate",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

