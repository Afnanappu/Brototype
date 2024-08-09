import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    afterDelayed(context);
    return Scaffold(
      body: Center(child: Image.asset("assets/splash logo black.png",),),
    );
  }

  Future<void> afterDelayed(context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed('/MainHomeScreen');
  }
}