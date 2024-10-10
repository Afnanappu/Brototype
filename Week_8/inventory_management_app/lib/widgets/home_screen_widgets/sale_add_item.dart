import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

Widget saleAddItem({required void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.white,
        border: Border.all(color: const Color.fromARGB(255, 228, 228, 228)),
        borderRadius: BorderRadius.circular(12)
      ),
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_rounded,color: MyColors.green,),
          SizedBox(
            width: 10,
          ),
          Text('Add Items', style: TextStyle(color: MyColors.green),),
        ],
      ),
    ),
  );
}
