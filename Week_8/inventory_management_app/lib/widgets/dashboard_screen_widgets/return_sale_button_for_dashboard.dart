import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_return_item_screen.dart';

class ReturnSaleButtonForDashboard extends StatelessWidget {
  const ReturnSaleButtonForDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //returns
              const Text(
                'Returns',
                style: MyFontStyle.listTileFont,
              ),
    
              //See all
              //todo: Add the see all button functions
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const AllReturnItemScreen()));
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: MyColors.green),
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
