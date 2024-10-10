// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/customer_fun.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/functions/reg_exp_functions.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_item_in_sale.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/buttons_for_add_new_sale_screen.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/current_sale_item_list_for_sale_screen.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/total_amount_section_for_sale_add_item_screen.dart';

// ignore: must_be_immutable
class SaleAddNew extends StatefulWidget {
  const SaleAddNew({
    super.key,
    this.customer,
    this.isEditable = false,
    this.isViewer = false,
  });
  final CustomerModel? customer;
  final bool isEditable;
  final bool isViewer;

  @override
  State<SaleAddNew> createState() => _SaleAddNewState();
}

ValueNotifier<double> totalAmountNotifier = ValueNotifier(0);

class _SaleAddNewState extends State<SaleAddNew> {
  final _customerNameController = TextEditingController();

  final _customerPhoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    if (widget.customer != null) {
      _customerNameController.text = widget.customer!.customerName;
      _customerPhoneController.text = widget.customer!.customerPhone;
      selectedDate = widget.customer!.saleDateTime;
      currentSaleItemNotifier.value = widget.customer!.saleId
          .map(
            (e) => getSaleFromDB(e),
          )
          .toList();
      totalAmountNotifier.value =
          getSumOfAllSaleOfOneCustomer(widget.customer!.saleId);
    }
    super.initState();
  }

  void _deleteCustomerIfSaleIsEmpty() async {
    if (widget.customer != null && currentSaleItemNotifier.value.isEmpty) {
      await deleteCustomerFromDB(widget.customer!.customerId!);
    }
  }

  @override
  void dispose() {
    _deleteCustomerIfSaleIsEmpty();
    currentSaleItemNotifier.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: widget.isViewer == false ? 'Add Sale' : 'Sale details',
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
                          Text('${customerListNotifier.value.length + 1}'),
                        ],
                      ),
                    ),
                  ),

                  //DatePick
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: InkWell(
                          onTap: () async {
                            if (!widget.isViewer) {
                              DateTime? pickedDate =
                                  await pickDateFromUser(context: context);

                              if (mounted) {
                                setState(() {
                                  if (pickedDate != null) {
                                    selectedDate = pickedDate;
                                  }
                                });
                              }
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
                labelText: 'Customer name',
                haveBorder: true,
                controller: _customerNameController,
                formFillColor: MyColors.white,
                isFormEnabled: !widget.isViewer,
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
                labelText: 'Phone no',
                haveBorder: true,
                isFormEnabled: !widget.isViewer,
                controller: _customerPhoneController,
                keyboardType: TextInputType.phone,
                formFillColor: MyColors.white,
                validator: (value) {
                  if (value == null || CustomRegExp.checkEmptySpaces(value)) {
                    return 'phone no is empty';
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

              //sale added list
              CurrentSaleItemListForSaleScreen(widget: widget),

              //add new item to sale
              (!widget.isViewer)
                  ? saleAddItem(onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) => const AddNewItemInSale()),
                      );
                    })
                  : const SizedBox(),
              const SizedBox(
                height: 15,
              ),

              //total Amount
              const TotalAmountSectionForSaleAddItemScreen(
                type: SaleType.sales,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonsForAddNewSaleScreen(
        saleWidget: widget,
        formKey: _formKey,
        nameController: _customerNameController,
        phoneController: _customerPhoneController,
        selectedDate: selectedDate,
        mounted: mounted,
      ),
    );
  }
}
