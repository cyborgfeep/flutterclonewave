import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclonewave/models/transaction.dart';
import 'package:flutterclonewave/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = false;
  List<Transaction> listTransaction=[
    Transaction(type: "Retrait", date: DateTime.now().toString(), montant: -1000),
    Transaction(type: "Dépot", date: DateTime.now().toString(), montant: 10000),
    Transaction(type: "Dépot", date: DateTime.now().toString(), montant: 10000),
    Transaction(type: "Retrait", date: DateTime.now().toString(), montant: -10000),
    Transaction(type: "Retrait", date: DateTime.now().toString(), montant: -10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 90,
          pinned: true,
          floating: true,
          backgroundColor: primaryColor,
          flexibleSpace: FlexibleSpaceBar(
              title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: isVisible ? "100.000" : "•••••••",
                    style: GoogleFonts.inter(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: isVisible ? "F" : "",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  alignment: Alignment.bottomCenter,
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    !isVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            margin: const EdgeInsets.only(right: 20),
          )),
          leadingWidth: 50,
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('Menu button');
            },
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            cardWidget(),
            optionWidget(),
          ],
        )),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade800.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: listTransaction.length,
              itemBuilder: (context, index) {
                Transaction transact=listTransaction[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transact.type,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor)),
                          Text(transact.date,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                      Text("${transact.montant}F",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                    ],
                  ),
                );
              },
              shrinkWrap: true,

            ),
          )
        ]))
      ],
    ));
  }

  cardWidget() {
    return GestureDetector(
      onTap: () {
        print('Tap');
      },
      child: Container(
          height: 220,
          color: primaryColor,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                image: const DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    width: 130,
                    height: 145,
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Column(
                      children: [
                        Image.asset("assets/images/qr.png"),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.photo_camera),
                            SizedBox(width: 5),
                            Text("Scanner")
                          ],
                        )
                      ],
                    ))),
          )),
    );
  }
  optionWidget(){
    return
      Stack(
        children: [
          SizedBox(child: Container(color:primaryColor), height: 50),
          Container(
              height: 100,
              margin:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonWidget(
                      CupertinoIcons.person_alt, "Transfert", primaryColor,
                          () {
                        print('Tapped Transfert');
                      }),
                  const VerticalDivider(),
                  buttonWidget(
                      CupertinoIcons.cart_fill, "Paiements", Colors.orange,
                          () {
                        print('Tapped Paiements');
                      }),
                  const VerticalDivider(),
                  buttonWidget(CupertinoIcons.device_phone_portrait, "Crédit",
                      Colors.lightBlueAccent, () {
                        print('Tapped Crédit');
                      })
                ],
              )),

        ],
      );
  }
  buttonWidget(IconData icon, String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 16, color: color, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
