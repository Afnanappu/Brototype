import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

File? image;

Future<File?> pickImageFrom(ImageSource source) async {
  final pickedImage = await ImagePicker().pickImage(source: source);
  if (pickedImage != null) {
    image = File(pickedImage.path);
    return image;
  }
  return null;
}

Uint8List? convertImageInToBlob() {
  if (image != null) {
    final Uint8List blobImage = image!.readAsBytesSync();
    return blobImage;
  } else {
    print("Image is null and can not be converted to blob");
  }
  return null;
}

// //Blob to image
// Image convertBlobToImage(Uint8List profile) {
//   final image = Image.memory(profile);
//   return image;
// }
