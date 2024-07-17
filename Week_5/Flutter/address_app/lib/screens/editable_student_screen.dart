import 'dart:io';
import 'dart:typed_data';
import 'package:address_app/db/db_functions.dart';
import 'package:address_app/db/student_model.dart';
import 'package:address_app/screens/modules/image_pick_local.dart';
import 'package:address_app/screens/modules/validations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentEditScreen extends StatefulWidget {
  const StudentEditScreen({super.key, required this.student});
  final StudentModel student;
  @override
  State<StudentEditScreen> createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends State<StudentEditScreen> {
  final _formKey = GlobalKey<FormState>();

  final _textNameController = TextEditingController();

  final _textAgeController = TextEditingController();

  final _textFatherController = TextEditingController();

  final _textPhoneController = TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    _textNameController.text = widget.student.name;
    _textAgeController.text = widget.student.age;
    _textFatherController.text = widget.student.father;
    _textPhoneController.text = widget.student.phone;
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
                  foregroundImage: (_selectedImage == null)
                      ? MemoryImage(widget.student.profile)
                      : FileImage(_selectedImage!),
                  backgroundColor: Colors.grey,
                  radius: 80,
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
                          if (_formKey.currentState!.validate()) {
                            //convert the image that selected into a blob and save it into DB
                            final Uint8List profile;
                            if(_selectedImage == null){
                              profile = widget.student.profile;
                            } else{
                              profile = convertImageInToBlob()!;
                            }
                            StudentModel student = StudentModel(
                                profile: profile,
                                name: _textNameController.text,
                                age: _textAgeController.text,
                                father: _textFatherController.text,
                                phone: _textPhoneController.text);
                            changeStudentDataFromDB(
                                widget.student.id!, student);

                            //
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          "Save",
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
