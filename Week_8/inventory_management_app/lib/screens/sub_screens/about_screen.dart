import 'package:flutter/material.dart';
import 'package:inventory_management_app/screens/sub_screens/privacy_and_policy_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/terms_and_conditions_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final Map socialLinks = {
    'Facebook': 'https://facebook.com/yourpage',
    'Twitter': 'https://twitter.com/yourprofile',
    'LinkedIn': 'https://linkedin.com/in/yourprofile',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "About",
          isAddIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/app/appstore.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'IM - Inventory Management',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'My IM - Inventory Management App is designed to help users manage their inventory in efficiently and can boost productivity. This app is mainly devoleped for mobile shops.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Developed by: AFNAN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact: afnanp860@gmial.com',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Acknowledgements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Special thanks to the Flutter community.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Open-source packages from pub.dev',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            // const Padding(
            //   padding:  EdgeInsets.symmetric(vertical: 2),
            //   child: Text(
            //     'Special thanks to the Flutter community.',
            //     style:  TextStyle(fontSize: 16),
            //     textAlign: TextAlign.center,
            //   ),
            // ),

            const SizedBox(height: 20),

            // Privacy Policy and Terms
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PrivacyPolicyScreen(),
              )),
              // launchUrl(Uri(path: 'IM.com/privacy',scheme: 'https')),
              child: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 16, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),

            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsAndConditionsScreen(),
              )),
              // launchUrl(Uri(path: 'IM.com/terms', scheme: 'https')),
              child: const Text(
                'Terms and Conditions',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),

            const SizedBox(height: 20),

            // Social Links Section
            const Text(
              'Follow Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: socialLinks.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => launchUrl(entry.value),
                    child: Column(
                      children: [
                        Icon(
                          _getSocialIcon(entry.key),
                          size: 30,
                        ),
                        Text(entry.key, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return Icons.facebook;
      case 'X':
        return FontAwesomeIcons.xTwitter;
      case 'linkedin':
        return FontAwesomeIcons.linkedin;
      default:
        return Icons.link;
    }
  }
}
