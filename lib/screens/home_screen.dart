import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int infected = 0;
  int deaths = 0;
  int recovered = 0;

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
                    Color(0xFF84FFFF),
                    Color(0xFF11249F),
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
          Text(
            "Live Update",
            textAlign: TextAlign.left,
            style: kTitleTextstyle,
          ),
          Spacer(flex: 1),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kInfectedColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Infected: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "$infected",
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDeathColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Deaths: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "$infected",
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kRecovercolor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Recovered: ",
                      style: kHeadingTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "$infected",
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          ElevatedButton(
            onPressed: null,
            child: Text("Refresh"),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
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
