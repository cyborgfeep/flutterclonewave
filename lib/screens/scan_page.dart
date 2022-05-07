import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterclonewave/main.dart';
import 'package:flutterclonewave/utils/constants.dart';
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
            //color: Colors.black.withOpacity(0.4),
            //padding: const EdgeInsets.symmetric(vertical: 30),
            child: Stack(children: <Widget>[
              AspectRatio(aspectRatio: MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,child: CameraPreview(
                _controller,
              ),),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.flash_on),
                        color: Colors.white,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1)),
                        width: 300,
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
              )
            ]),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: cardWidget(),
          )
        ],
      ),
      Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ToggleSwitch(
            initialLabelIndex: numPage,
            minWidth: 150,
            cornerRadius: 35,
            activeFgColor: numPage == 0 ? Colors.white : Colors.black,
            inactiveFgColor: Colors.white,
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
          ))
    ]));
  }
  cardWidget() {
    return GestureDetector(
      onTap: () {
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
}
