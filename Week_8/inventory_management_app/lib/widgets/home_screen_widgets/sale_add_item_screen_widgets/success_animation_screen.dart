import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:lottie/lottie.dart';

class SuccessAnimationScreen extends StatelessWidget {
  const SuccessAnimationScreen({super.key});

  Future<void> successDelay(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    successDelay(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: MyScreenSize.screenHeight*0.7,
            width: MyScreenSize.screenWidth*0.7,
            child: Lottie.asset(
              'lib/animations/success.json',
              repeat: false,
            )),
      ),
    );
  }
}
