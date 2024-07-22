import 'package:camera/camera.dart';
import 'package:camera_app/camera_screen.dart';
import 'package:flutter/material.dart';

//First add some permission code in 'android\app\src\debug\AndroidManifest.xml'

Future<void> main() async {
  //Don't skip this code
  WidgetsFlutterBinding.ensureInitialized();

  //Getting the list of camera available for User(Front is 1 and back is 0 camera of a phone or vise versa)
  final List<CameraDescription> cameraList = await availableCameras();

  runApp(
    //Passing the cameraList to MyApp Class
    MyApp(
      cameras: cameraList,
    ),
  );
}

class MyApp extends StatelessWidget {
  //Receiving the CameraList to camera
  const MyApp({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey,

      //Setting dark theme
      darkTheme: ThemeData.dark(),

      //Passing this CameraList to CameraScreen()
      home: CameraScreen(
        cameras: cameras,
      ),
    );
  }
}
