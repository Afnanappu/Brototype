// ignore_for_file: avoid_annotating_with_dynamic

import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';

// ignore: must_be_immutable
class DropDownForAll extends StatelessWidget {
  List<DropdownMenuItem<dynamic>> items;
  String? Function(dynamic)? validator;
  void Function(dynamic)? onChanged;
  void Function()? onTap;
  String hintText;
  dynamic nowValue;
  Color formFillColor;
  bool haveBorder;
  DropDownForAll(
      {super.key,
      this.nowValue,
      required this.items,
      required this.hintText,
      required this.onChanged,
      this.validator,
      this.onTap,
      this.formFillColor = MyColors.lightGrey,
      this.haveBorder = false});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: nowValue,
      hint: Text(
        hintText,
        style: MyFontStyle.smallLightGrey,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      borderRadius: BorderRadius.circular(20),
      dropdownColor: MyColors.white,
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: (haveBorder == false)
              ? BorderSide.none
              : const BorderSide(color: MyColors.darkGrey),
        ),
        focusColor: MyColors.blackShade,
        fillColor: formFillColor,
        filled: true,
        labelStyle: MyFontStyle.smallLightGrey,
        floatingLabelStyle: const TextStyle(
          color: MyColors.blackShade,
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        hintFadeDuration: const Duration(milliseconds: 200),
      ),
      validator: validator,
      items: items,
      onChanged: onChanged,
    );
  }
}
