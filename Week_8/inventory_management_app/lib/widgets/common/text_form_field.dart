import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';

Widget customFormField({
  required BuildContext context,
  required String labelText,
  required TextEditingController controller,
  String? Function(String? value)? validator,
  bool isFormEnabled = true,
  bool haveBorder = false,
  Color formFillColor = MyColors.lightGrey,
  TextInputType keyboardType = TextInputType.text,
  double vPadding = 15,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: vPadding),
    child: TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(color: MyColors.black),
      enabled: isFormEnabled,
      cursorOpacityAnimates: true,
      cursorColor: MyColors.blackShade,
      enableInteractiveSelection: true,
      keyboardType: keyboardType,
      cursorHeight: 18,
      onTapOutside: (event) {
        //To remove the focus.
        // ignore: use_build_context_synchronously
        FocusScope.of(context).unfocus();
      },
      minLines: 1,
      maxLines: null,
      
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: (haveBorder == false)
              ? BorderSide.none
              : const BorderSide(
                  color: MyColors.darkGrey,
                ),
        ),
        fillColor: formFillColor,
        filled: true,
        labelText: labelText,
        labelStyle: MyFontStyle.smallLightGrey,
        floatingLabelStyle: const TextStyle(
          color: MyColors.blackShade,
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        hintFadeDuration: const Duration(milliseconds: 200),
      ),
    ),
  );
}
