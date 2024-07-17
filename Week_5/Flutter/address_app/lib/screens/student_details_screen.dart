import 'package:address_app/db/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentDetailsScreen extends StatelessWidget {
   const StudentDetailsScreen({super.key, required this.student});
  final StudentModel student;

  final txtStyle = const TextStyle(fontSize: 18,fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
        ),
        backgroundColor:  Theme.of(context).primaryColor,
        titleSpacing: 0,
        systemOverlayStyle:const SystemUiOverlayStyle(statusBarColor: Colors.black26),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Theme.of(context).primaryColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 3,
                  blurRadius: 3,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //profile
              CircleAvatar(
                  foregroundImage: MemoryImage(student.profile),
                  backgroundColor: Colors.grey,
                  radius: 60,
                ),
                const SizedBox(height: 20,),
              
              //name
              Text("Name: ${student.name}\nAge: ${student.age}\nFather: ${student.father}\nPhone: ${student.phone}",style: txtStyle,),
            ],
          ),
        ),
      ),
    );
  }
}
