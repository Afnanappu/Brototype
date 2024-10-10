import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/screens/main_home_screen.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/splash logo black.png'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Login',
                        style: MyFontStyle.main,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customFormField(
                      context: context,
                      labelText: 'Username',
                      controller: _userController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else if (value != 'afnan') {
                          return "Username doesn't match";
                        } else {
                          return null;
                        }
                      }),
                  customFormField(
                      context: context,
                      labelText: 'Password',
                      controller: _userPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else if (value != '12345') {
                          return "Password doesn't match";
                        } else {
                          return null;
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        color: MyColors.green,
                        text: 'Login',
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            CustomSnackBarMessage(
                                context: context,
                                message: 'Login successfully completed',
                                color: MyColors.green);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const MainHomeScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
