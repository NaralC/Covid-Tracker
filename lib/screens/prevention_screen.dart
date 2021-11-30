import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utility/constants.dart';
import '../utility/my_clipper.dart';
import '../utility/reusable_card.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

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
              child: reusableCard(
                  washHandsImage, washHandsTitle, washHandsDescription),
            ),
            GestureDetector(
              onTap: () => {openURL(wearMaskURL)},
              child: reusableCard(
                  wearMaskImage, wearMaskTitle, wearMaskDescription),
            )
          ],
        ),
      ],
    ));
  }
}
