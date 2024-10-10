import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/models/item_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isExpandedPannel = false;

  @override
  Widget build(BuildContext context) {
    getTheOutOfStockItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: MyFontStyle.mainSub,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: outOfStockListNotifiers,
          builder: (context, itemModel, child) {
            return itemModel.isEmpty
                ? const Center(
                    child: Text('No notification'),
                  )
                : ListView.builder(
                    itemCount: itemModel.length,
                    itemBuilder: (context, index) {
                      final item = itemModel[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                )
                              ]),
                          child: ListTile(
                            title: const Text(
                              'Alert: Out of stock!',
                              style: MyFontStyle.mediumBlackShade,
                            ),
                            subtitle: Text(
                                'The item ${item.itemName} is out of stock, Ensure continuous availability by purchasing today.'),
                          ),
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
