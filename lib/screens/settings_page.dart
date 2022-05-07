import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              const Text('Paramètres', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
            child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Approvisionner son compte',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.account_balance,
                                  size: 30,
                                ),
                                SizedBox(width: 10),
                                Flexible(child: Text(
                                  "Lier votre banque",
                                  style: TextStyle(fontSize: 16),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Partager',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.share,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Inviter un ami à rejoindre Wave",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.sparkles,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Utiliser le code promotionnel",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assistance',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.phone_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Appeler le service client gratuitement",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Trouvez les agents à proximité",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.square_list_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Vérifiez votre plafond",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.shield_lefthalf_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Modifier votre code secret",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                  ),

          ),
              SliverToBoxAdapter(child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children:  [
                      const Icon(
                        Icons.login_rounded,
                        size: 30,
                      ),
                      const SizedBox(width: 16),
                      Flexible(child: Column(
                        children: const [
                          Text(
                            "Se déconnecter",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "(77 777 77 77)",
                            style: TextStyle(fontSize: 16,color: Colors.grey),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/uba.png",height: 25,color: Colors.grey.shade400,),
                          const SizedBox(width: 10),
                          Image.asset("assets/images/ecobank.png",height: 25,color: Colors.grey.shade400,),
                        ],
                      ),
                      const SizedBox(height: 10),
                       Text("Conditions générales de Wave",
                        style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
                      const SizedBox(height: 10),
                       Text("Version: 1.0.0 (build 1)",
                        style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
                    ],
                  ),
                ),
              )
        ])));
  }
}
