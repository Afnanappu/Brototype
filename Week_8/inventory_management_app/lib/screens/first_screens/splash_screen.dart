import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/screens/first_screens/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    afterDelayed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // afterDelayed(context);
    MyScreenSize.initialize(context);

    return Scaffold(
      body: SizedBox(
        height: MyScreenSize.screenHeight,
        width: MyScreenSize.screenWidth,
        child: LottieBuilder.asset(
          'assets/animations/Flow.json',
          repeat: false,
        ),
      ),
    );
  }
  Future<void> afterDelayed() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }


}
