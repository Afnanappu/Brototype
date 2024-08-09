import 'dart:io';
import 'package:flutter/material.dart';

class ShowImageScreen extends StatelessWidget {
  ShowImageScreen({super.key, required this.image});
  File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(image.path.split("/").last),),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              child: Image.file(image),
            ),
          ),
        ));
  }
}
