import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/all_list_tile_for_account_screen.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/app_bar_for_account_screen.dart';


// ignore: must_be_immutable
class AccountScreen extends StatelessWidget {
 const AccountScreen({super.key});

  // String _version = '';

  // Future<void> _loadVersionData() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //   _version = packageInfo.version;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 60),
        child: AppBarForAccountScreen(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SizedBox(
            height: MyScreenSize.screenHeight * 0.75,
            child: ListView(
              shrinkWrap: true,
              children: const [
                //list tile
                AllListTileForAccountScreen(),

                //version
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     const Text(
                //       'Version',
                //       style:
                //           TextStyle(color: Color.fromARGB(255, 223, 223, 223)),
                //     ),
                //     FutureBuilder(
                //       future: _loadVersionData(),
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState ==
                //             ConnectionState.waiting) {
                //           return const Text(
                //             '1.0.0',
                //             style: TextStyle(
                //                 color: Color.fromARGB(255, 223, 223, 223)),
                //           );
                //         } else if (snapshot.hasError) {
                //           return const Text(
                //             // 'Error: ${snapshot.error}',
                //             '1.0.0',
                //             style: TextStyle(
                //                 color: Color.fromARGB(255, 223, 223, 223)),
                //           );
                //         } else {
                //           return Text(
                //             _version,
                //             style: const TextStyle(
                //                 color: Color.fromARGB(255, 223, 223, 223)),
                //           );
                //         }
                //       },
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
