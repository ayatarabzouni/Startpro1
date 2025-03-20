import 'package:flutter/material.dart';
import 'adminlist.dart';
import 'url_launcher_helper.dart'; // ✅ Import your helper function

class ShipCompanyScreen extends StatefulWidget {
  @override
  _ShipCompanyScreenState createState() => _ShipCompanyScreenState();
}

class _ShipCompanyScreenState extends State<ShipCompanyScreen> {
  List<Map<String, String>> shippingCompanies = [
    {
      "name": "NAQEL",
      "description":
          "A premier logistics provider in Saudi Arabia, offering domestic and international shipping solutions.",
      "image": "assets/naqel_logo.png",
      "website": "https://www.naqelexpress.com/en/sa/"
    },
    {
      "name": "Zajil",
      "description":
          "A leading Saudi Arabian logistics company specializing in express delivery services.",
      "image": "assets/zajil_logo.png",
      "website": "https://zajil-express.com/"
    },
    {
      "name": "DHL",
      "description":
          "A global leader in logistics, offering fast shipping solutions across the world.",
      "image": "assets/dhl_logo.png",
      "website": "https://www.dhl.com/us-en/home/express.html"
    },
    {
      "name": "FedEx",
      "description":
          "An international courier delivery service known for its speed and reliability.",
      "image": "assets/fedex_logo.png",
      "website": "https://www.fedex.com/en-sa/home.html"
    }
  ];

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
              "Shipping Companies",
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
                itemCount: shippingCompanies.length,
                itemBuilder: (context, index) {
                  return _buildCompanyCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyCard(int index) {
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
              shippingCompanies[index]["image"]!,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              shippingCompanies[index]["name"]!,
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
                shippingCompanies[index]["description"]!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                openWebsite(shippingCompanies[index]["website"]!); // ✅ Use the helper function
              },
              child: const Text(
                "Visit website",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
