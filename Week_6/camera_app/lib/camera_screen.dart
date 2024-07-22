import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool isCameraAccessDenied = false;
  int selectedCamera = 0;
  late CameraDescription camera;

  //Creating a function to initialize the camera and this function is called in initState()
  void initCamera(int selectedCamera) {
    _cameraController =
        CameraController(widget.cameras[selectedCamera], ResolutionPreset.max);
    _cameraController.initialize().then(
      (_) {
        //If the camera is not mounted(isWorking || not removed)
        if (!mounted) {
          return;
        }
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

  //Initializing the camera
  @override
  void initState() {
    //Here selectedCamera is passed so that we can switch between front and back Camera
    //also the whole initialization is processed in initCamera function
    initCamera(selectedCamera);
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
            onPressed: () {},
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
                            if (selectedCamera == 0) {
                              selectedCamera = 1;
                            } else {
                              selectedCamera = 0;
                            }
                            initCamera(selectedCamera);
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
            final XFile image = await _cameraController.takePicture();
            print("XFile path: ${image.path}");
            final directory =
                join((await getExternalStorageDirectory())!.path, "Photos");
            await Directory(directory).create(recursive: true);
            final path = join(directory, "${DateTime.now()}.jpg");
            await image.saveTo(path);
            print("Saved Image to path ${path}");
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
