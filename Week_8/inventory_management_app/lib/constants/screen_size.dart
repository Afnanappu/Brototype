import 'package:flutter/material.dart';

class MyScreenSize {
  static late double screenWidth;
  static late double screenHeight;

  static void initialize(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print("Screen Height: $screenHeight, Screen Width: $screenWidth");
  }
  //Heights
  static final double screenHeight18 = screenHeight*0.02;
  static final double screenHeight10 = screenHeight*0.01;
  static final double screenHeight5 = screenHeight*0.005;

  //Widths
  static final double screenWidth12 = screenWidth*0.1;
}