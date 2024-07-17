import 'dart:io';
import 'package:address_app/db/db_functions.dart';
import 'package:address_app/db/student_model.dart';
import 'package:address_app/screens/modules/image_pick_local.dart';
import 'package:address_app/screens/modules/messages.dart';
import 'package:address_app/screens/modules/validations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentAddScreen extends StatefulWidget {
  const StudentAddScreen({super.key});

  @override
  State<StudentAddScreen> createState() => _StudentAddScreenState();
}

class _StudentAddScreenState extends State<StudentAddScreen> {
  final _formKey = GlobalKey<FormState>();

  final _textNameController = TextEditingController();

  final _textAgeController = TextEditingController();

  final _textFatherController = TextEditingController();

  final _textPhoneController = TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Student",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //profile pic
              GestureDetector(
                onTap: () {
                  pickImageFrom(ImageSource.gallery).then((value) {
                    setState(() {
                      _selectedImage = value;
                    });
                  });
                },
                child: CircleAvatar(
                  foregroundImage: (_selectedImage != null)
                      ? FileImage(_selectedImage!)
                      //todo: add demo image
                      : null,
                  backgroundColor: Colors.grey,
                  radius: 80,
                  child:const Icon(Icons.add_a_photo,color: Colors.white,size: 60,),
                ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Name filed
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _textNameController,
                        validator: (value) => nameValidate(value),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                            labelText: "Name", border: OutlineInputBorder()),
                      ),
                    ),

                    //Age
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _textAgeController,
                        validator: (value) => ageValidate(value),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                            labelText: "Age", border: OutlineInputBorder()),
                      ),
                    ),

                    //Father
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _textFatherController,
                        validator: (value) => nameValidate(value),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                            labelText: "Father", border: OutlineInputBorder()),
                      ),
                    ),

                    //phone
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _textPhoneController,
                        validator: (value) =>
                            (value == null || value.length > 10)
                                ? "Too many digits, try again"
                                : phoneValidate(value),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                            labelText: "Phone", border: OutlineInputBorder()),
                      ),
                    ),

                    //Add Button
                    SizedBox(
                      width: 100,
                      height: 45,
                      child: ElevatedButton(
                        //todo: add person to DB function
                        style: ButtonStyle(
                          backgroundColor: WidgetStateColor.resolveWith(
                            (states) => Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          if (_selectedImage == null) {
                            ShowSnackBarMessages(
                                message: "Profile pic is not added, try to add",
                                color: Colors.red,
                                context: context);
                          }
                          if (_formKey.currentState!.validate() &&
                              _selectedImage != null) {
                            //convert the image that selected into a blob and save it into DB
                            final profile = convertImageInToBlob();
                            StudentModel student = StudentModel(
                                profile: profile!,
                                name: _textNameController.text,
                                age: _textAgeController.text,
                                father: _textFatherController.text,
                                phone: _textPhoneController.text);
                            addStudentToDB(student: student);

                            //
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
