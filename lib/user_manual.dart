import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'adminlist.dart';

class UserManualScreen extends StatefulWidget {
  @override
  _UserManualScreenState createState() => _UserManualScreenState();
}

class _UserManualScreenState extends State<UserManualScreen> {
  String? uploadedFileName;

  // Function to handle file upload
  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        uploadedFileName = result.files.single.name; // Store uploaded file name
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

  // Function to handle file download
  Future<void> _downloadFile() async {
    if (uploadedFileName != null) {
      final Uri url = Uri.parse("https://yourserver.com/manuals/$uploadedFileName");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Download failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file uploaded yet')),
      );
    }
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
            // ✅ Navigate Back to Admin List Screen
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
              "User Manual",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Your step-by-step guide to mastering the platform. Download now and get all the details at your fingertips!",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Buttons
            ElevatedButton(
              onPressed: _uploadFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Upload", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _downloadFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Download", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
