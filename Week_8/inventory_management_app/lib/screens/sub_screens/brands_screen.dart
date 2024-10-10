import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/functions/reg_exp_functions.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/screens/sub_screens/delete_brand_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/edit_brand_screen.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/brand_crud_dialog_box_for_brand_screen.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/list_tile.dart';

class AccountBrands extends StatelessWidget {
  AccountBrands({super.key});

  final _addBrandController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "Brands",
          isAddIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: myListTile(
                context: context,
                title: 'Add Brand',
                icon: Icons.add,
                onTap: () {
                  BrandCRUD(
                      context: context,
                      validator: (value) {
                        if (value == null ||
                            CustomRegExp.checkEmptySpaces(value)) {
                          log(
                              'Empty space is detected and showing an error in text form field');
                          return 'Enter a brand name';
                        } else if (CustomRegExp.checkName(value)) {
                           log(
                              'The brand name you entered is correct so I am showing an error for debugging');
                          return 'Enter a valid brand name(use letters and spaces only)';
                        } else {
                           log(
                              'No problem for from');
                          return null;
                        }
                      },
                      title: 'Add new Brand',
                      text: 'Enter brand name',
                      controller: _addBrandController,
                      buttonText: 'Add',
                      buttonColor: MyColors.green,
                      message: 'Brand added successfully',
                      buttonFunction: () {
                        if (_formKey.currentState!.validate()) {
                          print('validator is worked');
                          final brand = ItemBrandModel(
                              itemBrandName: _addBrandController.text);
                          addBrandToDB(brand);
                          _addBrandController.text = '';
                        }
                      });
                },
              ),
            ),
            myListTile(
              context: context,
              title: 'Edit Brand',
              icon: Icons.edit_outlined,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => BrandEdit()));
              },
            ),
            myListTile(
              context: context,
              title: 'Delete Brand',
              icon: Icons.delete_outline,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const BrandDelete()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
