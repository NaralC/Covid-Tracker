import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utility/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

  final washHandsURL =
      'https://www.cdc.gov/handwashing/when-how-handwashing.html';
  final wearMaskURL =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks';

  openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            padding: EdgeInsets.only(left: 30, top: 50, right: 20),
            height: 350,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFCCFF90),
                  Color(0xFF2E7D32),
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/icons/virus.png"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Expanded(
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/Drcorona.svg",
                        width: 230,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                        top: 20,
                        left: 150,
                        child: Text(
                          "Stay home,\nsave the world.",
                          style:
                              kHeadingTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Text("Prevention", style: kTitleTextStyle),
        Column(
          children: [
            GestureDetector(
              onTap: () => {openURL(washHandsURL)},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 3,
                      ),
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wash_hands.png",
                      height: 75,
                      width: 75,
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          style: kSubTextStyle.copyWith(fontSize: 13),
                          children: [
                            TextSpan(
                              text: "Wash Your Hands!\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  fontSize: 18),
                            ),
                            TextSpan(
                                text:
                                    "Washing hands can keep you healthy and \n"
                                    "prevent the spread of respiratory and diarrheal \ninfections "
                                    "from one person to the next.")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {openURL(wearMaskURL)},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 3,
                      ),
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/wear_mask.png",
                      height: 75,
                      width: 75,
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: kSubTextStyle.copyWith(fontSize: 13),
                          children: [
                            TextSpan(
                              text: "Wear Your Mask!\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  fontSize: 18),
                            ),
                            TextSpan(
                                text:
                                    "Masks should be used as part of a strategy \n"
                                    "of measures to suppress transmission and \n"
                                    "save lives; ")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
