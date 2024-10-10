import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';

class BrandCRUD {
  BrandCRUD({
    required BuildContext context,
    required String title,
    String? text,
    int? brandId,
    TextEditingController? controller,
    String? controllerValue,
    required String buttonText,
    required Color buttonColor,
    required String message,
    String errorMessage = 'Error',
    bool haveTextField = true,
    String? content,
    void Function()? buttonFunction,
    void Function(int)? buttonFunctionWithArg,
    void Function(int, ItemBrandModel)? buttonFunctionWithArgAndBrand,
    String? Function(String? value)? validator,
  }) {
    if (controllerValue != null) {
      controller!.text = controllerValue;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: (haveTextField == true)
            ? customFormField(
                context: context,
                labelText: text!,
                controller: controller!,
                validator: validator,
              )
            : null,
        actions: [
          MyButton(
              color: buttonColor,
              text: buttonText,
              function: () {
                try {
                  if (buttonFunction != null) {
                    buttonFunction();
                  }
                  if (buttonFunctionWithArg != null && brandId != null) {
                    final isPossibleToDelete = itemModelListNotifiers.value.any(
                      (element) => element.brandId == brandId,
                    );

                    if (!isPossibleToDelete) {
                      buttonFunctionWithArg(brandId);
                    } else {
                      CustomSnackBarMessage(
                          context: context,
                          message: errorMessage,
                          color: MyColors.red);
                      Navigator.of(context).pop();
                    }
                  }
                  if (buttonFunctionWithArgAndBrand != null &&
                      brandId != null) {
                    final brand = ItemBrandModel(
                        itemBrandName: controller!.text, id: brandId);
                    buttonFunctionWithArgAndBrand(brandId, brand);
                    print('brand is edited');
                  }
                  CustomSnackBarMessage(
                      context: context,
                      message: message,
                      color: MyColors.green);
                  Navigator.of(context).pop();
                } catch (e) {
                  CustomSnackBarMessage(
                      context: context,
                      message: '$errorMessage: $e',
                      color: MyColors.red);
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
    );
  }
}
