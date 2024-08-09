import 'dart:io';

import 'package:camera_app/show_image_screen.dart';
import 'package:flutter/material.dart';

class ListImagesScreen extends StatefulWidget {
  const ListImagesScreen({super.key});

  @override
  State<ListImagesScreen> createState() => _ListImagesScreenState();
}

class _ListImagesScreenState extends State<ListImagesScreen> {
  late final List<File> _images;

  void _loadImageFromFile() {
    final directory = Directory('/storage/emulated/0/Pictures/CameraApp');
    final files = directory.listSync();
    final images = files
        .where((file) {
          final path = file.path;
          return path.endsWith(".jpg");
        })
        .map((file) => File(file.path))
        .toList();

    setState(() {
      _images = images;
    });
  }

  @override
  void initState() {
    _loadImageFromFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images"),
      ),
      body: GridView.builder(
        itemCount: _images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ShowImageScreen(image: _images[index])));
            },
            child: GridTile(
              child: Image.file(
                _images[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
