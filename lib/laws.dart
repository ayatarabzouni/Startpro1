import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'adminlist.dart';

class SaudiLawsScreen extends StatefulWidget {
  @override
  _SaudiLawsScreenState createState() => _SaudiLawsScreenState();
}

class _SaudiLawsScreenState extends State<SaudiLawsScreen> {
  List<Map<String, String>> laws = [
    {
      "title": "Business Licensing Requirements",
      "description": "Details on the required permits and approvals for starting a business in your chosen industry.",
      "pdf": "",
    },
    {
      "title": "Taxation and Financial Compliance",
      "description": "Overview of corporate tax laws, VAT regulations, and reporting requirements for startups.",
      "pdf": "",
    },
    {
      "title": "Employment and Labor Laws",
      "description": "Considerations for hiring employees, worker contracts, and labor compliance regulations.",
      "pdf": "",
    },
    {
      "title": "Industry-Specific Regulations",
      "description": "Regulations that apply to various sectors such as tech startups and food businesses.",
      "pdf": "",
    },
    {
      "title": "Environmental Compliance",
      "description": "Regulations for eco-impact assessments and environmental laws for new businesses.",
      "pdf": "",
    },
  ];

  Future<void> _pickPdfFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        laws[index]["pdf"] = result.files.single.path!; // ✅ Store full file path
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Uploaded: ${result.files.single.name}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  void _addNewLaw() {
    setState(() {
      laws.add({
        "title": "New Law",
        "description": "Description here...",
        "pdf": "",
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
              MaterialPageRoute(builder: (context) => AdminListScreen()), // ✅ Back to AdminListScreen
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: _addNewLaw, // ✅ Adds a new law dynamically
          ),
        ],
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
              "Saudi Laws & Regulations",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Stay compliant and licensed. Browse through regulations to ensure your startup is legally sound.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: laws.length,
                itemBuilder: (context, index) {
                  return _buildRegulationItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegulationItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            laws[index]["title"]!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            laws[index]["description"]!,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  laws[index]["pdf"]!.isNotEmpty
                      ? "📄 ${laws[index]["pdf"]!.split('/').last}" // ✅ Show file name only
                      : "No PDF uploaded",
                  style: const TextStyle(color: Colors.white60),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.upload_file, color: Colors.white),
                onPressed: () => _pickPdfFile(index),
              ),
            ],
          ),
          const Divider(color: Colors.white38),
        ],
      ),
    );
  }
}
