import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterclonewave/main.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController _controller;
  late PageController _pageController;
  int numPage = 0;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _pageController = PageController(initialPage: numPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      PageView(
        controller: _pageController,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              AspectRatio(
                aspectRatio: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height,
                child: CameraPreview(
                  _controller,
                ),
              ),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.srcOut),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          backgroundBlendMode: BlendMode
                              .dstOut), // This one will handle background + difference out
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 30, right: 30, top: 20),
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //fond noir et trou
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, top: 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                           ),
                        width: 400,
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Scanner le QR Code pour payer",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ) //scanner et text
            ]),
          ), //page 1 camera
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: RotatedBox(quarterTurns: 1, child: cardWidget()),
            ), //rotate pour retourner la carte
          ) //page 2 carte
        ],
      ), //les pages
      Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: numPage == 0 ? Colors.black : Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(35)),
            ),
            child: ToggleSwitch(
              initialLabelIndex: numPage,
              minWidth: 150,
              cornerRadius: 35,
              activeFgColor: numPage == 0 ? Colors.white : Colors.black,
              inactiveFgColor: numPage == 0 ? Colors.white : Colors.black,
              activeBgColor:
                  numPage == 0 ? const [Colors.grey] : const [Colors.white],
              inactiveBgColor: numPage == 0 ? Colors.black : Colors.grey,
              labels: const ["Scanner un code", "Ma carte"],
              totalSwitches: 2,
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  numPage = index!;
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                });
              },
            ),
          )), //switch
      Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          height: 50,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                color: numPage == 0 ? Colors.white : Colors.black,
              ),
              if (numPage == 0)
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(isFlashOn) {
                        _controller.setFlashMode(FlashMode.off);
                        isFlashOn = false;
                      } else {
                        _controller.setFlashMode(FlashMode.torch);
                        isFlashOn = true;
                      }
                    });
                  },
                  icon: isFlashOn ?const Icon(Icons.flashlight_off) : const Icon(Icons.flashlight_on),
                  color: Colors.white,
                )
            ],
          ),
        ),
      ) //button retour et Flashlight
    ]));
  }

  cardWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          padding:
              const EdgeInsets.only(bottom: 30, top: 30, left: 50, right: 50),
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
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Image.asset("assets/images/qr.png"),
                      ],
                    ))),
          )),
    );
  } //carte sans scanner
}
