import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String> pickImageFromFile() async {
  log('Image is picked from mobile');
  // ignore: invalid_use_of_visible_for_testing_member
  final path = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (path != null) {
    final image = await _saveToAppDir(path);

    return image.path;
  } else {
    throw 'Error while picking an image: $path';
  }
}

Future<File> _saveToAppDir(XFile imgPath) async {
  final Directory appDir = await getApplicationDocumentsDirectory();
  final String path = appDir.path;

  final fileName = '${DateTime.now().toIso8601String()}.png';
  var newImage = File('$path/item images/$fileName');
  if (await newImage.exists()) {
    print('Directory $newImage is already exist');
  } else {
    newImage = await newImage.create(recursive: true);
    print('Folder created at: ${newImage.path}');
  }

  return File(imgPath.path).copy(newImage.path);
}

Future<Uint8List?> pickImageFromWeb() async {
  log('Image is picked form Web');
  // ignore: invalid_use_of_visible_for_testing_member
  final path = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (path != null) {
    final imageByte = await path.readAsBytes();
    log('Image is converted to Bytes and returning');
    return imageByte;
  } else {
    log('Image is null');
    return null;
  }
}
