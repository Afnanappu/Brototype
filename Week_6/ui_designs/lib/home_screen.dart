import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Additional Information screen
            //todo: Add icons to the list items
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/additional_info_screen");
              },
              child: const Text("Additional information"),
            ),

            //Manage Store
            //todo: Check why the height and width of card is not changing 
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/manage_store_screen");
              },
              child: const Text("Manage Store"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/order_screen");
              },
              child: const Text("Order"),
            ),


            // Container(
            //   height: 100,
            //   width: 100,
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.red,
            //     spreadRadius: 10
            //       )
            //     ]
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
