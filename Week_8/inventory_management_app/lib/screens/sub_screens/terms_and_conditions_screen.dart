import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms and Conditions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to IM - Inventory Management App. By using our app, you agree to comply with these Terms & Conditions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Usage Guidelines",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- You are responsible for ensuring the accuracy of inventory data entered in the app.\n"
              "- You agree not to misuse the app or access it through unauthorized means (e.g., hacking or reverse engineering).\n"
              "- You may not use the app for illegal or unauthorized purposes.\n"
              "- We reserve the right to terminate your access if these terms are violated.\n",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Intellectual Property",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "All content provided in the app, including text, graphics, logos, and code, is the intellectual property of IM - Inventory Management App. You may not reproduce, copy, or use any content without permission.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Liability",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "We are not responsible for any data loss, misuse, or other issues arising from your use of the app. While we take every measure to ensure data security, you acknowledge that there are inherent risks when using electronic storage systems.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Changes to the Terms",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "We may update these Terms from time to time. You are encouraged to review this page periodically for any changes. Your continued use of the app after any updates implies acceptance of the revised terms.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "If you have any questions about our Terms & Conditions, please contact us at support@imapp.com.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
