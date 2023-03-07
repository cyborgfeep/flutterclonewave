import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclonewave/models/transaction.dart';
import 'package:flutterclonewave/screens/scan_page.dart';
import 'package:flutterclonewave/screens/settings_page.dart';
import 'package:flutterclonewave/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = false;
  final f = DateFormat('dd MMM yyyy à hh:mm');

  List<Transaction> listTransaction = [];

  @override
  void initState() {
    super.initState();
    listTransaction.addAll([
      Transaction(
          type: "Retrait",
          date: f.format(DateTime.now().toLocal()),
          montant: -1000),
      Transaction(
          type: "Dépot",
          date: f.format(DateTime.now().toLocal()),
          montant: 10000),
      Transaction(
          type: "Dépot",
          date: f.format(DateTime.now().toLocal()),
          montant: 10000),
      Transaction(
          type: "Retrait",
          date: f.format(DateTime.now().toLocal()),
          montant: -10000),
      Transaction(
          type: "Retrait",
          date: f.format(DateTime.now().toLocal()),
          montant: -10000),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: primaryColor),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          margin: const EdgeInsets.only(top: 250),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 90,
              pinned: true,
              floating: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                        child: RichText(
                      maxLines: 1,
                      text: TextSpan(
                        text: isVisible ? "1.000.000" : "•••••••",
                        style: GoogleFonts.inter(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: isVisible ? "F" : "",
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingsPage();
                  }));
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
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: listTransaction.length,
                  itemBuilder: (context, index) {
                    Transaction transact = listTransaction[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transact.type,
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor)),
                              Text(transact.date,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                            ],
                          ),
                          Text("${transact.montant}F",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
        )
      ],
    ));
  }

  cardWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ScanPage();
        }));
      },
      child: Container(
          height: 220,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                image: const DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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

  optionWidget() {
    return Column(children: [
      Container(
        height: 100,
        margin: const EdgeInsets.only(left: 16,right: 16, bottom: 10),
        child: GridView.count(crossAxisCount: 4, shrinkWrap: true, children: [
          buttonWidget(CupertinoIcons.person_alt, "Transfert", primaryColor,
              () {
            print('Tapped Transfert');
          }),
          buttonWidget(CupertinoIcons.cart_fill, "Paiements", Colors.orange,
              () {
            print('Tapped Paiements');
          }),
          buttonWidget(CupertinoIcons.device_phone_portrait, "Crédit",
              Colors.lightBlueAccent, () {
            print('Tapped Crédit');
          }),
          buttonWidget(Icons.account_balance_rounded, "Bank",
              Colors.redAccent, () {
            print('Tapped Bank');
          })
        ]),
      ),
      Container(
        height: 5,
        margin: const EdgeInsets.only(top: 20),
        color: Colors.grey.withOpacity(0.3),
      )
    ]);
  }

  buttonWidget(IconData icon, String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
