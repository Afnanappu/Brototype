import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_designs/home_screen.dart';
import 'package:ui_designs/screens/additional_info_screen.dart';
import 'package:ui_designs/screens/catalogue_screen.dart';
import 'package:ui_designs/screens/manage_store_screen.dart';
import 'package:ui_designs/screens/order_screen.dart';
import 'package:ui_designs/screens/payments_screen.dart';
import 'package:ui_designs/screens/premium_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Design',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black26),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (ctx) => const HomeScreen(),
        "/additional_info_screen": (ctx) =>const AdditionalInfoScreen(),
        "/manage_store_screen": (ctx) =>const ManageStoreScreen(),
        "/order_screen": (ctx) =>const OrderScreen(),
        "/catalogue_screen": (ctx) =>const CatalogueScreen(),
        "/payment_screen": (ctx) =>const PaymentsScreen(),
        "/premium_screen": (ctx) =>const PremiumScreen(),
      },
    );
  }
}
