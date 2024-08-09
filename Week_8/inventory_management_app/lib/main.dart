import 'package:flutter/material.dart';
import 'package:inventory_management_app/screens/main_home_screen.dart';
import 'package:inventory_management_app/screens/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
      routes: {
        "/MainHomeScreen" : (ctx)=>const MainHomeScreen(),
      },

    );
  }
}