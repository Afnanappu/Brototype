import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/models/item_model.dart';

class SearchBarForMain extends StatefulWidget {
  const SearchBarForMain({super.key});

  @override
  State<SearchBarForMain> createState() => _SearchBarForMainState();
}

class _SearchBarForMainState extends State<SearchBarForMain> {
  bool isSearchClicked = false;

  final _searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MyScreenSize.screenHeight10, bottom: MyScreenSize.screenHeight18),
      child: TextField(
        controller: _searchEditingController,
        cursorOpacityAnimates: true,
        cursorColor: MyColors.blackShade,
        enableInteractiveSelection: true,
        cursorHeight: 18,
        cursorRadius: const Radius.circular(20),
        keyboardType: TextInputType.text,
        //When the search bar is clicked, this function works and change the icon accordingly.
        onTap: () {
          if (isSearchClicked == false) {
            setState(() {
              isSearchClicked = true;
            });
          }
        },
      
        onChanged: (value) {
          setState(() {
            filteredItemModelList.value = itemModelListNotifiers.value
                .where(
                  (item) =>
                      item.itemName.toLowerCase().contains(value.toLowerCase()),
                )
                .toList();
          });
        },
      
        //When the user tap outside of the text field the focus is removed from the field.
        onTapOutside: (event) async {
          //Giving some delay to make it more realistic.
          await Future.delayed(const Duration(milliseconds: 400));
      
          setState(() {
            isSearchClicked = false;
          });
      
          //To remove the focus.
          // ignore: use_build_context_synchronously
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          fillColor: MyColors.lightGrey,
          filled: true,
          hintText: "Search",
          contentPadding: const EdgeInsets.only(left: 20),
          hintFadeDuration: const Duration(milliseconds: 200),
          hintStyle: MyFontStyle.smallLightGrey,
          //todo: Change the icon
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
      
            //Check whether the search bar is focussed or not to change the icon in the suffixIcon.
            child: IconButton(
              onPressed: () {
                if (isSearchClicked == true) {
                  setState(() {
                    _searchEditingController.text = '';
                  });
                }
              },
              icon: Icon(
                (isSearchClicked == true) ? Icons.close : Icons.search,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
