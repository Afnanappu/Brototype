
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/screens/sub_screens/all_sale_data_screen.dart';

class ResentSalesButtonForDashboard extends StatelessWidget {
  const ResentSalesButtonForDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Brands
          const Text(
            'Resent',
            style: MyFontStyle.listTileFont,
          ),
        
          //See all
          //todo: Add the see all button functions
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => AllSaleDataScreen()));
            },
            child: const Text(
              'See all',
              style: TextStyle(color: MyColors.green),
            ),
          ),
        ],
      ),
    );
  }
}
