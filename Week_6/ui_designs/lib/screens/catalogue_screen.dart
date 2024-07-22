import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  List<String> productName = [
    "Couch Potato | Women...",
    "Couch Potato | Men | Bl...",
    'Mug | Explore',
    'Combo Blast 1 | Pack..',
    'Mug | Orchard',
    'Combo Blast 2 | Expla..',
    'I See Combo Pack',
    'Kids Combo Blast'
  ];
  List<String> productPrice = [
    '799',
    '799',
    '399',
    '699',
    '499',
    '599',
    '1299',
    '1199'
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              text: "Products",
            ),
            Tab(
              text: "Categories",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListView.builder(
            itemCount: productPrice.length,
            itemBuilder: (BuildContext context, int index) {
              return Products(
                  title: productName[index],
                  price: productPrice[index],
                  image: productImage[index]);
            },
          ),
          const Center(
            child: Text("Empty Catalogue"),
          )
        ],
      ),
    );
  }
}

//---------------List Items---------------//

class Products extends StatefulWidget {
  Products({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.isSwitchOn = true,
  });

  String image, title, price;
  bool isSwitchOn;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        height: 200,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              spreadRadius: 2,
              blurRadius: 3,

            )
          ]
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 100,
                width: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200]!,
                        spreadRadius: 2,
                        blurRadius: 3)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title),
                  const FaIcon(FontAwesomeIcons.ellipsisVertical)
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("1 Piece"),
                  Text(
                    "₹${widget.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "In Stock",
                        style: TextStyle(color: Colors.green),
                      ),
                      Switch(
                        value: widget.isSwitchOn,
                        onChanged: (onChanged) {
                          setState(() {
                            (widget.isSwitchOn == true)
                                ? widget.isSwitchOn = false
                                : widget.isSwitchOn = true;
                          });
                        },
                        activeColor: Colors.blue,
                        trackOutlineWidth: WidgetStateProperty.resolveWith((_)=>0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                "Share Product",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.share_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
