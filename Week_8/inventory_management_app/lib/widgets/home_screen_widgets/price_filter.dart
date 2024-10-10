import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/extension_methods.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

bool isVisible = false;

class _PriceFilterState extends State<PriceFilter> {
  final ValueNotifier<double> _fromValue = ValueNotifier(0);
  final ValueNotifier<double> _toValue = ValueNotifier(100000000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MyScreenSize.screenHeight18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _textFieldForPrice(
            context,
            hintText: 'From',
            onChanged: (value) {
              getTheItemFilteredByRange(value.parseDouble(), _toValue.value);
            },
          ),
          _textFieldForPrice(
            context,
            hintText: 'To',
            onChanged: (value) {
              getTheItemFilteredByRange(_fromValue.value, value.parseDouble());
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {
                (isVisible == false) ? isVisible = true : isVisible = false;
              });
            },
            icon: const Tooltip(
              message: 'Price filter',
              preferBelow: false,
              child: Icon(
                Icons.filter_alt_outlined,
                size: 28,
                semanticLabel: 'Price filter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _textFieldForPrice(
  BuildContext context, {
  required String hintText,
  void Function(String value)? onChanged,
}) {
  return Visibility(
    visible: isVisible,
    child: SizedBox(
      height: 30,
      width: MyScreenSize.screenWidth * 0.3,
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        onTapOutside: (event) {
          // Focus.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    ),
  );
}
