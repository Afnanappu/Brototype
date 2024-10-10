import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/functions/pick_image.dart';
import 'package:inventory_management_app/models/profile_model.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  final _formKey = GlobalKey<FormState>();

  final _businessName = TextEditingController();

  final _phoneNo = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();

  bool isEditable = false;
  String? image;
  Uint8List? webImage;
  ProfileModel? profile;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    profile = await getProfile();
    if (profile != null) {
      _businessName.text = profile!.name ?? 'not found';
      _phoneNo.text = profile!.phone ?? 'not found';
      _email.text = profile!.email ?? 'not found';
      _address.text = profile!.address ?? 'not found';
      if (!kIsWeb) {
        image = profile!.image;
      } else {
        webImage = base64Decode(profile!.image!);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: 'Business Profile',
          onPressed: () {
            setState(() {
              isEditable = true;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (isEditable == true) {
                        if (!kIsWeb) {
                          image = await pickImageFromFile();
                        } else {
                          webImage = await pickImageFromWeb();
                        }
                        setState(() {});
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.lightGrey,
                      backgroundImage: (image != null)
                          ? FileImage(File(image!))
                          : (webImage != null)
                              ? MemoryImage(webImage!)
                              : null,
                      radius: 76,
                      child: (image == null)
                          ? const Text(
                              'No image selected',
                              style: MyFontStyle.smallLightGrey,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customFormField(
                    context: context,
                    labelText: 'Business name',
                    controller: _businessName,
                    isFormEnabled: isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  customFormField(
                      context: context,
                      labelText: 'Phone no',
                      controller: _phoneNo,
                      keyboardType: TextInputType.phone,
                      isFormEnabled: isEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else if (value.length != 10) {
                          return 'Enter a valid phone no';
                        } else {
                          return null;
                        }
                      }),
                  customFormField(
                      context: context,
                      labelText: 'Email',
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      isFormEnabled: isEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else if (!value.contains('@') &&
                            !value.contains('.')) {
                          return 'Enter a valid email';
                        } else {
                          return null;
                        }
                      }),
                  customFormField(
                      context: context,
                      labelText: 'Address',
                      controller: _address,
                      keyboardType: TextInputType.streetAddress,
                      isFormEnabled: isEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else {
                          return null;
                        }
                      }),
                  (isEditable == true)
                      ? MyButton(
                          color: MyColors.green,
                          text: 'Save',
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              final profile = ProfileModel(
                                name: _businessName.text,
                                phone: _phoneNo.text,
                                email: _email.text,
                                address: _address.text,
                                image: image,
                              );
                              updateProfile(profile);

                              setState(() {
                                isEditable = false;
                              });
                              CustomSnackBarMessage(
                                context: context,
                                message: 'Profile changed successfully',
                                color: MyColors.green,
                              );
                            }
                          },
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
