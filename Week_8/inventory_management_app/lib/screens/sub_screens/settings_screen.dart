import 'package:flutter/material.dart';
import 'package:inventory_management_app/database/password_fun.dart';
import 'package:inventory_management_app/screens/sub_screens/about_screen.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/bottom_sheet_for_help_and_support.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/list_tile.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/alert_dialog.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  ValueNotifier<bool> isSwitchOn = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "Settings",
          isAddIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            myListTile(
                context: context,
                title: 'Set password',
                icon: isSwitchOn.value? Icons.lock_outline: Icons.lock_open_outlined,
                trailingWidget: FutureBuilder(
                  future: havePassword(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      isSwitchOn.value = snapshot.data??false;
                    }
                    return ValueListenableBuilder(
                      valueListenable: isSwitchOn,
                      builder: (context, isSwitch, child) => Switch(
                          value: isSwitch,
                          onChanged: (value) async {
                            isSwitchOn.value = value;
                            await havePassword(value);
                            // await setPassword('value');
                          }),
                    );
                  },
                )),
            myListTile(
              context: context,
              title: 'Help & Support',
              icon: Icons.support_agent_outlined,
              onTap: () {
                CustomHelpBottomSheet(context: context);
              },
            ),
            myListTile(
              context: context,
              title: 'Rate this app',
              icon: Icons.star_rate_outlined,
              onTap: () {
                customAlertBox(
                  context: context,
                  title: 'Rate this app',
                  content: 'Open website to rate this app?',
                  onPressedYes: () {},
                );
              },
            ),
            myListTile(
              context: context,
              title: 'Share this app',
              icon: Icons.share_outlined,
            ),
            myListTile(
              context: context,
              title: 'About',
              icon: Icons.info_outline,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AboutScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
