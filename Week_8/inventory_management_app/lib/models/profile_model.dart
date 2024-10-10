import 'package:hive_flutter/hive_flutter.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String? image;

  ProfileModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.image,
  });
}

Future<void> updateProfile(ProfileModel value) async {
  final box = await Hive.openBox<ProfileModel>('profile');
  await box.put('profile', value);
  print('\n\nprofile is added\n\n');
}

Future<ProfileModel?> getProfile() async {
  final box = await Hive.openBox<ProfileModel>('profile');
  return box.get('profile');
}
