import 'package:address_app/db/db_functions.dart';
import 'package:address_app/screens/editable_student_screen.dart';
import 'package:address_app/screens/modules/messages.dart';
import 'package:address_app/screens/student_details_screen.dart';
import 'package:flutter/material.dart';

//--------------------List View------------------//

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudentFromDB();
    return ValueListenableBuilder(
      valueListenable: studentModelSearchNotifier,
      builder: (context, student, child) {
        if (student.isEmpty) {
          return const Center(
            child: Text("No student found"),
          );
        } else {
          return ListView.builder(
            itemCount: student.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 217, 217, 217),
                          blurRadius: 3,
                          spreadRadius: 2,
                        )
                      ]),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => StudentDetailsScreen(
                              student: student[index],
                            ))),
                    leading: CircleAvatar(
                      //image of student
                      foregroundImage: MemoryImage(student[index].profile),
                      backgroundColor: Colors.grey,
                      radius: 30,
                    ),
                    title: Text(
                      student[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Wrap(
                      children: [
                        //Edit button
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => StudentEditScreen(
                                      student: student[index],
                                    )));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),

                        //Delete button
                        IconButton(
                          onPressed: () {
                            alertMessage(context, "Delete student",
                                "Are you sure?", student[index].id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

//--------------------Grid View------------------//

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentModelSearchNotifier,
      builder: (context, student, child) {
        if (student.isEmpty) {
          return const Center(
            child: Text("No student found"),
          );
        } else {
          return GridView.builder(
            itemCount: student.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 217, 217, 217),
                          blurRadius: 3,
                          spreadRadius: 2,
                        )
                      ]),
                  child: GridTile(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => StudentDetailsScreen(
                                          student: student[index],
                                        ))),
                            child: CircleAvatar(
                              foregroundImage:
                                  MemoryImage(student[index].profile),
                              backgroundColor: Colors.grey,
                              radius: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            student[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => StudentEditScreen(
                                            student: student[index],
                                          )));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  alertMessage(context, "Delete student",
                                      "Are you sure?", student[index].id!);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

void alertMessage(BuildContext context, String title, String content, int id) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  deleteStudentFromDB(id);
                  Navigator.of(context).pop();
                  ShowSnackBarMessages(
                      message: "Student deleted successfully",
                      color: Colors.green,
                      context: context);
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
              ),
            ],
          ));
}
