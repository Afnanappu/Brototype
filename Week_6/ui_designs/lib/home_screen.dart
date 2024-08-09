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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/additional_info_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("Additional information"),
            ),

            //Manage Store
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/manage_store_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("Manage Store"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/order_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("Order"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/catalogue_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("catalogue"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/payment_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("Payment"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/premium_screen");
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(double.maxFinite, 20),
                ),
              ),
              child: const Text("Dukaan Premium"),
            ),
          ],
        ),
      ),
    );
  }
}
