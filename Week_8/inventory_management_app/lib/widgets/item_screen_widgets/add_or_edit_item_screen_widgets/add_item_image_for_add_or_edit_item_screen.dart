import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/functions/pick_image.dart';

class AddItemImageForAddOrEditItemScreen extends StatelessWidget {
  const AddItemImageForAddOrEditItemScreen({
    super.key,
    required this.imageNotifier,
    required this.webImageNotifier,
  });

  final ValueNotifier<String?> imageNotifier;
  final ValueNotifier<Uint8List?> webImageNotifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (kIsWeb) {
          webImageNotifier.value = await pickImageFromWeb();
        } else {
          imageNotifier.value = await pickImageFromFile();
        }
      },
      //image
      child: ValueListenableBuilder(
        valueListenable: !kIsWeb ? imageNotifier : webImageNotifier,
        builder: (context, value, child) => Container(
          height: MyScreenSize.screenHeight * 0.4,
          width: MyScreenSize.screenWidth * 0.8,
          decoration: BoxDecoration(
              image: (value != null)
                  ? DecorationImage(
                      image: !kIsWeb
                          ? FileImage(File(value as String))
                          : MemoryImage(value as Uint8List),
                      fit: BoxFit.contain,
                    )
                  : null,
              color: MyColors.lightGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: (value == null) ? const Text('add image') : null,
          ),
        ),
      ),
    );
  }
}
