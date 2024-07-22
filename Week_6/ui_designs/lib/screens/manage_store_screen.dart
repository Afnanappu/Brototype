import 'package:flutter/material.dart';

class ManageStoreScreen extends StatefulWidget {
  const ManageStoreScreen({super.key});

  @override
  State<ManageStoreScreen> createState() => _ManageStoreScreenState();
}

class _ManageStoreScreenState extends State<ManageStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Store"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          MyCards(
            name: "Marketing Designs",
            bgColor: Colors.orange,
            icon: const Icon(
              Icons.campaign_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
          MyCards(
            name: "Online Payment",
            bgColor: Colors.lightGreen,
            icon: const Icon(
              Icons.currency_rupee,
              size: 35,
              color: Colors.white,
            ),
          ),
          MyCards(
            name: "Discount Coupons",
            icon: const Icon(
              Icons.discount_outlined,
              size: 35,
              color: Colors.white,
            ),
            bgColor: Colors.orangeAccent,
          ),
          MyCards(
            name: "My Customers",
            icon: const Icon(
              Icons.people_outlined,
              size: 35,
              color: Colors.white,
            ),
            bgColor: Colors.teal,
          ),
          MyCards(
            name: "Store QR Code",
            icon: const Icon(
              Icons.center_focus_weak,
              size: 35,
              color: Colors.white,
            ),
            bgColor: Colors.grey,
          ),
          MyCards(
            name: "Extra Charges",
            icon: const Icon(
              Icons.money_sharp,
              size: 35,
              color: Colors.white,
            ),
            bgColor: Colors.purple,
          ),
          MyCards(
            name: "Order Form",
            newCard: true,
            icon: const Icon(
              Icons.article,
              size: 35,
              color: Colors.white,
            ),
            bgColor: Colors.pink,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Order"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Manage"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account")
        ],
        currentIndex: 3,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
      ),
    );
  }
}

//---------------Card-----------------//

class MyCards extends StatelessWidget {
  Icon icon;
  String name;
  Color bgColor;
  bool newCard;

  MyCards({
    super.key,
    required this.name,
    required this.icon,
    required this.bgColor,
    this.newCard = false,
  });

  @override
  Widget build(BuildContext context) {
    //todo: Check why the height and width is not changing
    return Card(
      margin: const EdgeInsets.only(top: 15, bottom: 15, left: 12, right: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Wrap(
                children: [
                  //this will place an icon here
                  Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: icon,
                  ),

                  //Title of the card
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: const Alignment(1, -1),
                  child: (newCard == true)
                      ? Container(
                          height: 25,
                          width: 45,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "NEW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )),
                        )
                      : const Text("")),
            ),
          ),
        ],
      ),
    );
  }
}
