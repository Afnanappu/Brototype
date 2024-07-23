import 'dart:io';
import 'package:camera/camera.dart';
import 'package:camera_app/list_images_screen.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  //Receiving the cameraList to cameras through Constructor
  final List<CameraDescription> cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //Creating a CameraController for controlling whole camera related process
  late CameraController _cameraController;

  //To find is cameraAccess is given or not
  bool isCameraAccessDenied = false;

  //To change the camera(Front and Back)
  int selectedCamera = 0;

  //
  List<File> _images = [];

  //Creating a function to initialize the camera and this function is called in initState()
  void _initCamera(int selectedCamera) {
    //Selecting a camera(Front or Back) and it's resolution(like 720p, 1080p...)
    //ResolutionPreset.max gives the maximum supported clarity of photo
    _cameraController =
        CameraController(widget.cameras[selectedCamera], ResolutionPreset.max);
    _cameraController.initialize().then(
      (_) {
        //If the camera is not mounted(isWorking || not removed)
        if (!mounted) {
          return;
        }
        //refreshing the screen
        setState(() {});
      },

      //If any error occurs the onError() will handle the error
    ).onError(
      (error, _) {
        //Checking that this error related to Camera(is will return a bool)
        if (error is CameraException) {
          switch (error.code) {
            //checking whether that User give access to the camera if not :
            //Throws when the camera permission is not allowed
            case "CameraAccessDenied":
              isCameraAccessDenied = true;
              break;

            //Throws when the Audio for video is not allowed
            //Here we are only taking pictures so Audio is not relevant that why it return null
            case "AudioAccessDenied":
              null;
          }
        }
      },
    );
  }

  void _getStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      print("Asked for storage permission");
      await Permission.storage.request();
      print("Storage Permission is granted");
    }
  }

  //Initializing the camera
  @override
  void initState() {
    //Here selectedCamera is passed so that we can switch between front and back Camera
    //also the whole initialization is processed in initCamera function
    _initCamera(selectedCamera);
    _getStoragePermission();
    super.initState();
  }

 

  //To dispose the camera controller(Stopping the camera preview)
  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
        actions: [
          //Folder Icon and function
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const ListImagesScreen()));
            },
            icon: const Icon(
              Icons.folder,
            ),
          ),
        ],
      ),

      //Checking that camera permission is given or not if not given a text is showed
      body: (isCameraAccessDenied == true)
          ? const Center(
              child: Text(
                "Camera access is denied",
                style: TextStyle(color: Colors.white),
              ),
            )
          //Checking after permission that the camera is initialized(is working) or not
          // if not a CircularProgressIndicator is showed else The preview is showed
          : (!_cameraController.value.isInitialized)
              ? const Center(child: CircularProgressIndicator())

              //Camera preview
              : Column(
                  children: [
                    CameraPreview(_cameraController),
                    const SizedBox(
                      height: 30,
                    ),

                    //Camera Change from front to back and vice versa
                    IconButton(
                        onPressed: () {
                          setState(() {
                            //
                            selectedCamera = selectedCamera == 0 ? 1 : 0;
                            _initCamera(selectedCamera);
                          });
                          print("Camera switched");
                        },
                        icon: const Icon(
                          Icons.rotate_left_rounded,
                          size: 30,
                        )),
                  ],
                ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () async {
            try {
              print("Image Captured");

              //Takes a picture and give return the file where it is saved
              final XFile image = await _cameraController.takePicture();
              print("XFile path: ${image.path}");

              final path = image.path;
              await GallerySaver.saveImage(path, albumName: "CameraApp")
                  .then((value) => print("Saved Image to path ${path}"))
                  .onError(
                    (error, _) => print("Error while saving the image: $error"),
                  );

              _showPreviewDialog(context, File(path));
            } catch (e) {
              print("Error while saving image: $e");
            }
          },
          backgroundColor: Colors.white,
          autofocus: true,
          shape: const CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void _showPreviewDialog(BuildContext context, File imageFile) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(imageFile),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    },
  );
}
