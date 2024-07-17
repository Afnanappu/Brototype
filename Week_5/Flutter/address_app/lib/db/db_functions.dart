import 'package:address_app/db/student_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentModelNotifier = ValueNotifier([]);
ValueNotifier<List<StudentModel>> studentModelSearchNotifier =
    ValueNotifier([]);

//Search student among all
// void findSearch(String text) {
//   studentModelSearchNotifier.value.clear();
//   for (var item in studentModelNotifier.value) {
//     if (item.name.toLowerCase().contains(text)) {
//       studentModelSearchNotifier.value.add(item);
//       notifySearch();
//     }
//   }
// }
Database? _db;

Future searchFromDB(String text) async {
  studentModelSearchNotifier.value.clear();
  if (text.isEmpty) {
    studentModelSearchNotifier.value.addAll(studentModelNotifier.value);
    notifySearch();
  } else {
    final result = await _db!.query(
      'Student',
      where: 'name = ?',
      whereArgs: [text],
    );
    for (var map in result) {
      studentModelSearchNotifier.value.add(StudentModel.fromMap(map));
    }
    notifySearch();
  }
}

void notifySearch() {
  studentModelSearchNotifier.notifyListeners();
}

//SetUp
Future<void> initializeDatabase() async {
  //checking that if the _db is null or not
  _db ??= await openDatabase(
    'Student.db',
    version: 1,
    onOpen: (db) => print("Database is opened"),
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Student (id INTEGER PRIMARY KEY, profile BLOB, name TEXT, age TEXT, father TEXT, phone TEXT)");
    },
    onUpgrade: (db, oldVersion, newVersion) {},
  );
  print("Database Initialized");
}
//

//Select all
Future<void> getAllStudentFromDB() async {
  if (_db != null) {
    final allStudents = await _db!.rawQuery("SELECT * FROM Student");

    studentModelNotifier.value.clear();
    studentModelSearchNotifier.value.clear();

    //this loop will convert all student data from DB to studentModelNotifier list
    for (var student in allStudents) {
      final stdn = StudentModel.fromMap(student);
      studentModelNotifier.value.add(stdn);
      studentModelSearchNotifier.value.add(stdn);
    }
  } else {
    print("DB is null");
  }
  //to notify the ValueListenableBuilder that this file is changed
  studentModelNotifier.notifyListeners();
  notifySearch();
}

//Create(Add)
Future<void> addStudentToDB({required StudentModel student}) async {
  if (_db != null) {
    await _db!.rawInsert(
        "INSERT INTO Student(profile, name, age, father, phone) VALUES(?, ?, ?, ?, ?)",
        [
          student.profile,
          student.name,
          student.age,
          student.father,
          student.phone
        ]);
    getAllStudentFromDB();
    print("Student is added");
  } else {
    print("DB is null");
  }
}

//Delete
Future<void> deleteStudentFromDB(int id) async {
  _db!.rawDelete("DELETE FROM Student WHERE id = ?", [id]);
  getAllStudentFromDB();
  print("Student is deleted from DB");
}

//Delete all, Use if necessary
Future<void> deleteAllStudentFromDB() async {
  _db!.rawDelete("DELETE FROM Student");
  getAllStudentFromDB();
  print("All Student is deleted from DB");
}

//Update
Future<void> changeStudentDataFromDB(int id, StudentModel student) async {
  //Here id and student.id are different so if we want to change the same student we want to use id
  _db!.rawUpdate(
      "UPDATE Student SET profile = ?, name = ?, age = ?, father = ?, phone = ? WHERE id = ?",
      [
        student.profile,
        student.name,
        student.age,
        student.father,
        student.phone,
        id
      ]);
  getAllStudentFromDB();
  print("Student data is changed");
}
