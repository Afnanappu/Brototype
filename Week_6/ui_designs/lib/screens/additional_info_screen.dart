import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.share,
              size: 30,
            ),
            title: Text("Share Dukaan App"),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          const ListTile(
            //todo: add icon
            // leading: Icon(Icons.),
            title: Text("Change Language"),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          ListTile(
            //todo: add icon
            // leading: Padding(padding: EdgeInsets.all(10),child: Image.asset("assets/icons/whatsApp_icon.png",colorBlendMode:BlendMode.clear )),
            title: const Text("WhatsApp Chat Support"),
            trailing: Switch(
                value: isSwitchPressed,
                onChanged: (isClicked) {
                  setState(() {
                    isSwitchPressed = isClicked;
                  });
                  print(
                      "Switch is ${(isSwitchPressed == true) ? "ON" : "OFF"}");
                }),
          ),
          const ListTile(
            //todo: add icon
            // leading: Icon(Icons.),
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
    );
  }
}
