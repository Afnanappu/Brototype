import 'package:address_app/db/db_functions.dart';
import 'package:address_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  //saying to flutter that every thing is fine in this program so you can run the app
  WidgetsFlutterBinding.ensureInitialized();

  //initializing db
   await initializeDatabase();
  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student app",
      theme: ThemeData(primarySwatch: Colors.teal, primaryColor: Colors.teal),
      home: const HomeScreen(),
    );
  }
}
