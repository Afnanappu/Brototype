import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 170,
                    child: AppBar(
                      title: const Text("Dukaan Premium"),
                      toolbarHeight: 70,
                      centerTitle: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Container(
                      width: 320,
                      height: 190,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(0.8, 0.7),
                              children: [
                                Image.asset(
                                  "assets/icons/logo.png",
                                  height: 70,
                                  width: 120,
                                ),
                                const Text(
                                  "PREMIUM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const Text(
                              "Get Dukaan Premium for just ₹4,999/year",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "All the advanced feature for scaling your business",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              //Body
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Feature
                    const Text(
                      " Features",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //List
                    ListItem(
                      title: "Custom domain name",
                      subtitle:
                          'Get your own custom domain and build your brand on the internet.',
                      icon: Icons.language_outlined,
                    ),
                    ListItem(
                      title: "Verified seller badge",
                      subtitle:
                          'Get green verified badge under your store name and build trust.',
                      icon: Icons.verified_outlined,
                    ),
                    ListItem(
                      title: "Dukaan for PC",
                      subtitle:
                          'Access all the exclusive premium features on Dukaan for PC.',
                      icon: Icons.laptop,
                    ),
                    ListItem(
                      title: "Priority support",
                      subtitle:
                          'Get your questions resolved with our priority customer support.',
                      icon: Icons.headset_mic_outlined,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What is Dukaan Premium",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    //Youtube image
                    Container(
                        height: 190,
                        width: 500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/icons/youtube_video.png",
                            ),
                          ),
                        ),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.youtube,
                          color: Color.fromARGB(255, 255, 17, 0),
                          size: 60,
                        )))
                  ],
                ),
              ),

              const Divider(
                thickness: 2,
              ),

              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      //Frequently asked questions
                      const Text(
                        "Frequently asked questions",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      //
                      AskedQuestion(
                        question:
                            "What type of businesses can use Dukaan Premium",
                        answer:
                            "Dukaan caters to a wide variety of sellers. Be it a small grocery store or a big legacy brand - anyone who wants to sell their products/services online - Dukaan is the perfect platform for you.",
                      ),
                      const Divider(),
                      AskedQuestion(question: "What is your refund policy"),
                      const Divider(),
                      AskedQuestion(
                          question:
                              "Will there be an automatic charge after the paid trail"),
                      const Divider(),
                      AskedQuestion(
                          question: "What payment methods do you offer"),
                      const Divider(),
                      AskedQuestion(
                          question: "What happens when my free trial ends"),
                      const Divider(),
                      AskedQuestion(
                          question: "What are the terms for the custom domain"),
                      const Divider(),
                    ],
                  )),
            ],
          ),

          const Divider(
            thickness: 2,
          ),

          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Need help? Get in touch",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12,),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.grey)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.black,
                            ),
                            Text(
                              "Live Chat",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.grey)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            Text(
                              "Phone Call",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const Divider(),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Select Domain",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor:
                          WidgetStateColor.resolveWith((_) => Colors.blue),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Get Premium",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  String title, subtitle;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          border: Border.all(color: Colors.blue, width: 2.5),
        ),
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}

//Frequently asked questions

class AskedQuestion extends StatelessWidget {
  AskedQuestion({super.key, required this.question, this.answer = ''});

  String question, answer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "$question?",
              style: const TextStyle(fontWeight: FontWeight.w500),
              softWrap: true,
            ),
          ),
          Icon((answer.isNotEmpty) ? Icons.minimize : Icons.add),
        ],
      ),
      subtitle: (answer.isNotEmpty) ? Text(answer) : null,
    );
  }
}
