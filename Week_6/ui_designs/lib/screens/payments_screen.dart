import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----AppBar----//
      appBar: AppBar(
        // scrolledUnderElevation: 10,

        title: const Text("Payments"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.info_outline),
          ),
        ],
      ),

      //-----Body----//
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10)),

              //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text
                  const Text(
                    "Transaction Limit",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Text
                  const Text(
                    "A free limit up to which you will receive the online payments directly in your bank",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 12),

                  //Linear Progress Bar
                  LinearProgressIndicator(
                    value: .26664,
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                  ),
                  const Text(
                    "36,668 left out of 50,000",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            const WidgetStatePropertyAll(Size(100, 35)),
                        backgroundColor:
                            WidgetStateColor.resolveWith((_) => Colors.blue),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: const Text(
                      "Increase limit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            //Default Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                const Text(
                  "Default Method",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      //
                      Text(
                        "Online Payment",
                        style: TextStyle(color: Colors.grey),
                      ),

                      SizedBox(
                        width: 5,
                      ),

                      //
                      FaIcon(FontAwesomeIcons.angleRight,
                          size: 20, color: Colors.grey)
                    ],
                  ),
                )
              ],
            ),

            //Payment Profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payment Profile",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      //
                      Text(
                        "Bank Account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(FontAwesomeIcons.angleRight,
                          size: 20, color: Colors.grey)
                    ],
                  ),
                )
              ],
            ),

            const Divider(),

            //Payment Overview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                const Text(
                  "Payment Overview",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),

                //Life Time
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Life Time",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),

            //AMOUNT ON HOLD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AMOUNT ON HOLD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "₹0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                //AMOUNT RECEIVED
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AMOUNT RECEIVED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "₹13,332",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 6),

            //Transaction
            const Text(
              "Transaction",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),

            //Buttons
            Row(
              children: [
                //On hold
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "On hold",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(
                  width: 5,
                ),

                //Payouts
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateColor.resolveWith((_) => Colors.blue)),
                  child: const Text(
                    "Payouts (15)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(
                  width: 5,
                ),

                //Refunds
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Refunds",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            //-------------------List Items-------------------//
            Expanded(
              child: ListView.separated(
                itemCount: orderItemList.length,
                separatorBuilder: (ctx, index) => const Divider(),
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      ListTile(
                        leading: Container(
                          height: 100,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Image.asset(
                            orderItemList[index].productOrderImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order #${orderItemList[index].productOrderNumber}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Text("₹${orderItemList[index].productOrderPrice}"),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            Text(orderItemList[index].productOrderDateTime),

                            //
                            const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Successful")
                              ],
                            )
                          ],
                        ),
                      ),

                      //
                      Text(
                        "     ₹${orderItemList[index].productOrderPrice} deposited to 58860200000138",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------List Items-------------------//

List<OrderItem> orderItemList = [
  //1
  OrderItem(
    productOrderNumber: "1688068",
    productOrderDateTime: "Jul 12, 02:06 PM",
    productOrderPrice: "799",
    productOrderImage: 'assets/items/Couch Potato Men.webp',
  ),

  //2
  OrderItem(
    productOrderNumber: "1457741",
    productOrderDateTime: "Apr 26, 07:47 AM",
    productOrderPrice: "397.4",
    productOrderImage: 'assets/items/Mug Explore.jpg',
  ),

  //3
  OrderItem(
    productOrderNumber: "1408896",
    productOrderDateTime: "Apr 11, 10:54 AM",
    productOrderPrice: "686.42",
    productOrderImage: 'assets/items/I See Combo Pack.jpeg',
  ),

  //4
  OrderItem(
    productOrderNumber: "1369633",
    productOrderDateTime: "Apr 2, 11:29 AM",
    productOrderPrice: "1123.5",
    productOrderImage: 'assets/items/Couch Potato Men.webp',
  ),

  //5
  OrderItem(
    productOrderNumber: "1370125",
    productOrderDateTime: "Apr 2, 11:29 AM",
    productOrderPrice: "1722.75",
    productOrderImage: 'assets/items/Couch Potato Women.webp',
  ),

  //6
  OrderItem(
    productOrderNumber: "1370568",
    productOrderDateTime: "Apr 1, 11:19 AM",
    productOrderPrice: "884.17",
    productOrderImage: 'assets/items/Couch Potato Women.webp',
  ),

  //7
  OrderItem(
    productOrderNumber: "1379971",
    productOrderDateTime: "Apr 1, 10:37 AM",
    productOrderPrice: "599.25",
    productOrderImage: 'assets/items/Combo Blast 1.png',
  ),

  //8
  OrderItem(
    productOrderNumber: "1259931",
    productOrderDateTime: "Mar 6, 01:26 PM",
    productOrderPrice: "2,297",
    productOrderImage: 'assets/items/I See Combo Pack.jpeg',
  ),

  //9
  OrderItem(
      productOrderNumber: "1173537",
      productOrderDateTime: "Feb 22, 10:04 PM",
      productOrderPrice: "599.25",
      productOrderImage: 'assets/items/Kids Combo Blast.png'),

  //10
  OrderItem(
      productOrderNumber: "1173256",
      productOrderDateTime: "Feb 21, 01:25 PM",
      productOrderPrice: "524.25",
      productOrderImage: 'assets/items/Kids Combo Blast.png'),

  //11
  OrderItem(
    productOrderNumber: "1172354",
    productOrderDateTime: "Feb 21, 10:20 PM",
    productOrderPrice: "699",
    productOrderImage: 'assets/items/Combo Blast 2.png',
  ),

  //12
  OrderItem(
    productOrderNumber: "1172225",
    productOrderDateTime: "Feb 20, 9:54 AM",
    productOrderPrice: "1123.5",
    productOrderImage: 'assets/items/Couch Potato Men.webp',
  ),

  //13
  OrderItem(
    productOrderNumber: "1172165",
    productOrderDateTime: "Feb 19, 10:47 AM",
    productOrderPrice: "799",
    productOrderImage: 'assets/items/Couch Potato Men.webp',
  ),

  //14
  OrderItem(
    productOrderNumber: "1171865",
    productOrderDateTime: "Feb 18, 12:08 PM",
    productOrderPrice: "524.25",
    productOrderImage: 'assets/items/Mug Orchard.jpeg',
  ),

  //15
  OrderItem(
    productOrderNumber: "1171800",
    productOrderDateTime: "Feb 13, 07:57 aM",
    productOrderPrice: "524.25",
    productOrderImage: 'assets/items/Mug Orchard.jpeg',
  )
];

List<String> productImage = [
  'assets/items/Couch Potato Women.webp',
  'assets/items/Couch Potato Men.webp',
  'assets/items/Mug Explore.jpg',
  'assets/items/Combo Blast 1.png',
  'assets/items/Mug Orchard.jpeg',
  'assets/items/Combo Blast 2.png',
  'assets/items/I See Combo Pack.jpeg',
  'assets/items/Kids Combo Blast.png'
];

class OrderItem {
  String productOrderNumber;
  String productOrderDateTime;
  String productOrderPrice;
  String productOrderImage;

  OrderItem(
      {required this.productOrderNumber,
      required this.productOrderDateTime,
      required this.productOrderPrice,
      required this.productOrderImage});
}
