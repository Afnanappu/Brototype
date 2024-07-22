import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order #1688068"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //date and order delivered part
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //date
                  Text("May 31, 05:42 PM"),

                  //Delivered
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Delivered",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 104, 104)),
                      )
                    ],
                  ),
                ],
              ),

              const Divider(),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Item number
                  Text(
                    "1 ITEM",
                    style: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
                  ),

                  //Receipt
                  Row(
                    children: [
                      Icon(
                        Icons.receipt_outlined,
                        color: Color.fromARGB(255, 0, 102, 186),
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "RECEIPT",
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 102, 186)),
                      )
                    ],
                  ),
                ],
              ),

              //ListTile (Item details)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    'assets/items/navy blue t-shirt.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("Explore | Men | Navy Blue"),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 Piece\nSize: XL",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.looks_one_outlined,
                              color: Colors.blue,
                            ),
                            Text(" X ₹799")
                          ],
                        ),
                        Text("₹799")
                      ],
                    )
                  ],
                ),
              ),

              const Divider(),

              //
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Item Total"), Text("₹799")],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery"),
                  Text(
                    "FREE",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grand Total",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "₹799",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),

              //
              const Divider(),

              //-----------CUSTOMER DETAILS---------//
              //
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CUSTOMER DETAILS",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 104, 104, 104)),
                  ),
                  //SHARE icon
                  Row(
                    children: [
                      Icon(Icons.share_outlined, color: Colors.blue),
                      Text(
                        " SHARE",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),

              //Customer name and phone number
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "AFNAN P",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("+91-9947907247"),
                trailing: Wrap(
                  children: [
                    //I used stack to create a phone logo
                    //Phone icon
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          size: 22,
                          color: Colors.blue,
                        ),
                        Icon(
                          Icons.panorama_fish_eye,
                          size: 40,
                          color: Colors.blue,
                        )
                      ],
                    ),

                    SizedBox(
                      width: 14,
                    ),

                    //I used FontAwesomeIcons to get the whatsApp icon
                    // WhatsApp icon
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 39,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              //Address
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle:
                    Text("D 1101 Chartered Beverly\nHills, Subramanyapura P.O"),
              ),

              //
              const Row(
                children: [
                  //City
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "City",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("Bangalore"),
                    ),
                  ),

                  //Pincode
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Pincode",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("560061"),
                    ),
                  )
                ],
              ),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Payment
                  Expanded(
                    child: const ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Payment",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("Online"),
                    ),
                  ),

                  //PAID
                  Container(
                    height: 28,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 178, 241, 180),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color:const Color.fromARGB(255, 216, 249, 219)
                    ),
                    child:const Center(
                        child: Text(
                      "PAID",
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 163, 22), fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),

              //
              const Divider(),
              //-------------ADDITIONAL INFORMATION---------//
              //
              const Row(
                children: [
                  Text(
                    "ADDITIONAL INFORMATION",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 104, 104, 104),
                    ),
                  ),
                ],
              ),

              //State
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "State",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Karnataka"),
              ),

              //Email
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("afnanp860@gmail.com"),
              ),

              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: WidgetStateBorderSide.resolveWith(
                      (_) => const BorderSide(color: Colors.blue)),
                  fixedSize:
                      const WidgetStatePropertyAll(Size(double.maxFinite, 30)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  "Shared receipt",
                  style: TextStyle(color: Colors.blue),
                ),
              ),

              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
