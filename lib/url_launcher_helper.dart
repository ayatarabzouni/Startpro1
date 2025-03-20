import 'package:url_launcher/url_launcher.dart';


void openWebsite(String url) async {
  Uri uri = Uri.parse(url); // Ensure URL is properly formatted

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw "Could not launch $url";
  }
}
