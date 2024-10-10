import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "At IM - Inventory Management App, we are committed to safeguarding the privacy of our users. This Privacy Policy outlines how we collect, use, and protect your information.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Information We Collect",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- Personal Information: We collect information such as your name, email address, and contact details when you register or use the app.\n"
              "- Usage Data: This includes information about how you use the app, including interactions, error logs, and app settings.\n"
              "- Inventory Data: All inventory data entered, such as items, sales, and stock, are securely stored and used to help manage your business more efficiently.\n",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "How We Use Your Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- To provide and improve the functionality of the app.\n"
              "- To offer customer support and address any issues you may have.\n"
              "- To analyze usage patterns for improving features and user experience.\n"
              "- Your data will not be sold or shared with third parties without your consent.\n",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Data Security",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "We implement security measures to protect your data from unauthorized access or disclosure. While we strive to use industry-standard measures, no method of electronic storage is completely secure, and we cannot guarantee absolute security.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "If you have any questions about our Privacy Policy, please contact us at support@imapp.com.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
