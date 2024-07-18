import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  bool isSwitchPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Additional information"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  //Share Dukaan App
                  leading: Icon(
                    Icons.share,
                    size: 30,
                  ),
                  title: Text("Share Dukaan App"),
                  trailing: Icon(Icons.chevron_right_sharp),
                ),

                //Change Language
                const ListTile(
                  //todo: add icon
                  leading: Icon(
                    Icons.language_outlined,
                    size: 30,
                  ),
                  title: Text("Change Language"),
                  trailing: Icon(Icons.chevron_right_sharp),
                ),

                //WhatsApp Chat Support
                ListTile(
                  //todo: add icon
                  leading: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    size: 30,
                  ),
                  title: const Text("WhatsApp Chat Support"),
                  trailing: Switch(
                      value: isSwitchPressed,
                      activeColor: Colors.blue,
                      trackOutlineWidth: WidgetStateProperty.resolveWith((_)=>0),
                      onChanged: (isClicked) {
                        setState(() {
                          isSwitchPressed = isClicked;
                        });
                        print(
                            "Switch is ${(isSwitchPressed == true) ? "ON" : "OFF"}");
                      }),
                ),

                //Privacy Policy
                const ListTile(
                  //todo: add icon
                  leading: FaIcon(
                    FontAwesomeIcons.lock,
                    size: 30,
                  ),
                  title: Text("Privacy Policy"),
                ),

                //Rate Us
                const ListTile(
                  leading: Icon(
                    Icons.star_border,
                    size: 30,
                  ),
                  title: Text("Rate Us"),
                ),

                //Sign out
                const ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  title: Text("Sign Out"),
                ),
              ],
            ),
          ),

          //Version part
          const Padding(
            padding: EdgeInsets.only(bottom: 18),
            child: Column(
              children: [
                Text("Version", style: TextStyle(color: Colors.grey)),
                Text(
                  "2.4.2",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 118, 118, 118)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
