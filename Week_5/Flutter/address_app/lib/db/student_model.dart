import 'dart:typed_data';

class StudentModel {
  int? id;
  Uint8List profile;
  String name;
  String age;
  String father;
  String phone;

  StudentModel(
      {required this.profile,
      required this.name,
      required this.age,
      required this.father,
      required this.phone,
      this.id});

  static StudentModel fromMap(Map<String, Object?> map) {
    int? id = map['id'] as int;
    Uint8List profile = map['profile'] as Uint8List;
    String name = map['name'] as String;
    String age = map['age'] as String;
    String father = map['father'] as String;
    String phone = map['phone'] as String;

    return StudentModel(
        id: id,
        profile: profile,
        name: name,
        age: age,
        father: father,
        phone: phone);
  }
}
