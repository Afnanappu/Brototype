import 'dart:core';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/purchase_sale_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/functions/reg_exp_functions.dart';
import 'package:inventory_management_app/models/purchase_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_item_in_sale.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/current_purchase_list_for_purchase_screen.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/buttons_for_add_new_sale_screen.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/total_amount_section_for_sale_add_item_screen.dart';

class AddNewPurchaseScreen extends StatefulWidget {
  const AddNewPurchaseScreen({
    super.key,
    this.purchaseModel,
    this.isViewer = false,
    this.total,
  });

  final PurchaseModel? purchaseModel;
  final bool isViewer;
  final double? total;

  @override
  State<AddNewPurchaseScreen> createState() => _AddNewPurchaseScreenState();
}

final ValueNotifier<List<PurchaseItemModel>> currentPurchaseListNotifier =
    ValueNotifier([]);

class _AddNewPurchaseScreenState extends State<AddNewPurchaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _purchaserNameController =
      TextEditingController();
  final TextEditingController _purchaserPhoneController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.purchaseModel != null) {
      _purchaserNameController.text = widget.purchaseModel!.partyName;
      if (widget.purchaseModel!.phone != null) {
        _purchaserPhoneController.text = widget.purchaseModel!.phone!;
      }
      currentPurchaseListNotifier.value = getPurchaseSaleOfOnePurchase(
          widget.purchaseModel!.purchaseItemModleIdList);

      selectedDate = widget.purchaseModel!.dateTime;
    }
  }

  @override
  void dispose() {
    currentPurchaseListNotifier.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: 'Add Purchase',
          isAddIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(color: MyColors.lightGrey))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Invoice No.'),
                          Text('${purchasedListNotifier.value.length + 1}'),
                        ],
                      ),
                    ),
                  ),

                  //DatePick
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        child: InkWell(
                          onTap: () async {
                            if (widget.isViewer == false) {
                              DateTime? pickedDate =
                                  await pickDateFromUser(context: context);

                              setState(
                                () {
                                  if (pickedDate != null) {
                                    selectedDate = pickedDate;
                                  }
                                },
                              );
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Date'),
                              Row(
                                children: [
                                  Text(formatDateTime(date: selectedDate)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              customFormField(
                context: context,
                labelText: 'Party name',
                haveBorder: true,
                isFormEnabled: !widget.isViewer,
                controller: _purchaserNameController,
                formFillColor: MyColors.white,
                validator: (value) {
                  if (value == null || CustomRegExp.checkEmptySpaces(value)) {
                    return 'Customer name is empty';
                  } else if (!CustomRegExp.checkName(value)) {
                    return 'Enter a valid name (use letter and space only)';
                  } else {
                    return null;
                  }
                },
              ),
              customFormField(
                context: context,
                labelText: 'Phone no (Optional)',
                isFormEnabled: !widget.isViewer,
                haveBorder: true,
                controller: _purchaserPhoneController,
                keyboardType: TextInputType.phone,
                formFillColor: MyColors.white,
                validator: (value) {
                  if (value == null || CustomRegExp.checkEmptySpaces(value)) {
                    return null;
                  } else if (!CustomRegExp.checkPhoneNumber(value)) {
                    return 'Enter a valid phone number';
                  } else if (value.length < 10) {
                    return 'Enter 10 digit number';
                  } else if (value.length > 10) {
                    return 'Too many digits, try again';
                  } else {
                    return null;
                  }
                },
              ),

              //purchase added list

               CurretenPurchaseListForPurchaseAddScreen(isViewer: widget.isViewer,),

              //add new item to sale
              if(widget.isViewer == false)
              saleAddItem( 
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const AddNewItemInSale(
                        isPurchase: true,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 15,
              ),

              //total Amount
              TotalAmountSectionForSaleAddItemScreen(total: widget.total,type: SaleType.purchase,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonsForAddNewSaleScreen(
        formKey: _formKey,
        isPurchase: true,
        purchaseWidget: widget,
        nameController: _purchaserNameController,
        phoneController: _purchaserPhoneController,
        selectedDate: selectedDate,
        mounted: mounted,
      ),
    );
  }
}
